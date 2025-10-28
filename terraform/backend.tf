terraform {
  backend "gcs" {
    bucket = "gcp-prj-tfstate-86fe"
//    prefix = "terraform/bootstrap/state"
  }
}
