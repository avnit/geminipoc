import base64
import json
from vertexai.language_models import TextEmbeddingInput, TextEmbeddingModel

# private helper function to handle the duplicated code
def _get_embeddings(texts, task, model_name="text-embedding-004", dimensionality=256):
    """Generates embeddings for a list of texts.
    Args:
        texts (list): A list of strings to be embedded.
        task (str): The task type for the embedding model.
        model_name (str): The name of the text embedding model to use.
        dimensionality (int): The desired output dimensionality of the embeddings.
    Returns:
        list: A list of embedding value lists.
    """
    model = TextEmbeddingModel.from_pretrained(model_name)
    inputs = [TextEmbeddingInput(text, task) for text in texts]
    kwargs = dict(output_dimensionality=dimensionality) if dimensionality else {}
    embeddings = model.get_embeddings(inputs, **kwargs)
    return [embedding.values for embedding in embeddings]

def embedding(texts, task, model_name="text-embedding-004", dimensionality=256):
    """Public function that wraps the embedding logic."""
    return _get_embeddings(texts, task, model_name, dimensionality)

def process_pubsub_message(event, context):
    """Background Cloud Function triggered by Pub/Sub."""
    if 'data' in event:
        # Decode the Pub/Sub message
        message_data = base64.b64decode(event['data']).decode('utf-8')
        data_json = json.loads(message_data)

        # Extract data for the embedding function
        texts = data_json.get("texts")
        task = data_json.get("task", "DEFAULT_TASK") # Provide a sensible default

        # Generate embeddings by calling the helper function
        if texts:
            embeddings = _get_embeddings(texts, task)
            # Here you would add logic to store or process the embeddings
            print(f"Generated {len(embeddings)} embeddings.")
            return embeddings
    return "No data to process."