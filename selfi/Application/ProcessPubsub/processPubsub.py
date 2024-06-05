import base64
import json

from google.cloud import aiplatform
from google.cloud import pubsub_v1


PROJECT_ID = "sl-dev-gmni-prj"
REGION = "us-central1"  


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
