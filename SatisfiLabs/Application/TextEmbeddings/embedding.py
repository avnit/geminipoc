import typing

from vertexai.language_models import TextEmbeddingInput, TextEmbeddingModel # type: ignore


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
