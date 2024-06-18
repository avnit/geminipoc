resource "google_pubsub_schema" "incoming-message" {
  name = "message"
  type = "AVRO"
  definition = "{\n  \"type\" : \"record\",\n  \"name\" : \"Avro\",\n  \"fields\" : [\n    {\n      \"name\" : \"StringField\",\n      \"type\" : \"string\"\n    },\n    {\n      \"name\" : \"IntField\",\n      \"type\" : \"int\"\n    }\n  ]\n}\n"
}

resource "google_pubsub_topic" "example" {
  name = "incoming-message-topic"

  depends_on = [google_pubsub_schema.incoming-message]
  schema_settings {
    schema = "projects/my-project-name/schemas/example"
    encoding = "JSON"
  }
}