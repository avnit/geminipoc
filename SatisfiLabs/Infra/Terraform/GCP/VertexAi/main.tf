terraform {
 backend "gcs" {
   bucket  = "satisfi-core"
   prefix  = "terraform/state/vertexai"
 }
}

provider "google" {
  credentials = file(var.credentials[var.envt])
  project     = var.project_id[var.envt]
  region      = var.region
}


resource "google_vertex_ai_index" "docs" {
  project             = var.project_id[var.envt]
  region              = var.region
  display_name        = var.docs_index_name
  index_update_method = "STREAM_UPDATE"
  labels              = var.labels
  metadata {
    #contents_delta_uri = "gs://${google_storage_bucket.main.name}/vector-search-index"
    config {
      dimensions                  = 768
      approximate_neighbors_count = 150
      shard_size                  = "SHARD_SIZE_SMALL"
      distance_measure_type       = "SQUARED_L2_DISTANCE"
      algorithm_config {
        tree_ah_config {
          leaf_node_embedding_count    = 1000
          leaf_nodes_to_search_percent = 10
        }
      }
    }
  }
 
}

resource "google_vertex_ai_index_endpoint" "docs" {
  project                 = var.project_id[var.envt]
  region                  = var.region
  display_name            = var.docs_index_endpoint_name
  public_endpoint_enabled = true
  labels                  = var.labels
}
