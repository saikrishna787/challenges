provider "google" {
  project = "test-project-373715"
  region  = "us-central1-a"
}

resource "google_compute_project_metadata" "default" {
  metadata = {
    terraform-gcp-integration = "enabled"
  }
}
terraform {
  backend "gcs" {
    bucket = var.bucket
    prefix = "bucket"
  }
}