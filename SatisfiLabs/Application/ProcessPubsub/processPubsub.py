import base64
import json

from google.cloud import aiplatform
from google.cloud import pubsub_v1
import typing

from vertexai.language_models import TextEmbeddingInput, TextEmbeddingModel # type: ignore
PROJECT_ID = "sl-dev-gmni-prj"
REGION = "us-central1"  

# from vertexai import generative_models
# from vertexai.generative_models import GenerativeModel
# model = GenerativeModel(model_name="gemini-1.0-pro-vision")
# response = model.generate_content(["What is this?"])

def embed_text(
    texts: typing.List[str] = ["banana muffins? ", "banana bread? banana muffins?"],
    task: str = "RETRIEVAL_DOCUMENT",
    model_name: str = "text-embedding-004",
    dimensionality: typing.Optional[int] = 256,
) -> typing.List[typing.List[float]]:
    """Embeds texts with a pre-trained, foundational model."""
    model = TextEmbeddingModel.from_pretrained(model_name)
    # model = GenerativeModel(model_name="gemini-1.5-pro")
    inputs = [TextEmbeddingInput(text, task) for text in texts]
    kwargs = dict(output_dimensionality=dimensionality) if dimensionality else {}
    embeddings = model.get_embeddings(inputs, **kwargs)
    return [embedding.values for embedding in embeddings]

def process_pubsub_message(event, context):
    """Background Cloud Function to be triggered by Pub/Sub.
    Args:
         event (dict):  The dictionary withdata specific to this type of
                        event. The `data` field contains the PubsubMessage message.
         context (google.cloud.functions.Context): The Cloud Functions event
                        metadata.
    """
    pubsub_message = base64.b64decode(event["data"]).decode("utf-8")
    data = json.loads(pubsub_message)

    # Extract the message content from your Pub/Sub data structure
    message_text = data["message_text"] 

    # Initialize Vertex AI endpoint and make prediction
    endpoint = aiplatform.Endpoint(
        f"projects/{PROJECT_ID}/locations/{REGION}/endpoints/your-endpoint-id"
    )
    response = endpoint.predict(instances=[{"content": message_text}])

    prediction = response.predictions[0]

    # Process the prediction (e.g., sentiment analysis)
    print(f"Prediction: {prediction}")
    # Here you would integrate with Vertex AI services 
    # For example: 
    # 1. Send the message to Vertex AI for language processing tasks
    # 2. Log predictions, etc.
    embed_text(message_text)
  
def publish_to_pubsub(topic_name, message):
    """Publishes a message to a Pub/Sub topic."""
    publisher = pubsub_v1.PublisherClient()
    topic_path = publisher.topic_path(PROJECT_ID, topic_name)

    data = message.encode("utf-8")
    future = publisher.publish(topic_path, data)
    print(future.result())


# Example usage
message_to_publish = '{"message_text": "This is a test message for Vertex AI"}'
publish_to_pubsub("your-topic-name", message_to_publish)  # Replace with your topic
