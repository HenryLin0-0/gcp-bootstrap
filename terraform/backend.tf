terraform {
  backend "gcs" {
    bucket = "gcp-prj-tfstate-1111"
    prefix = "terraform/projects/state"
  }
}
