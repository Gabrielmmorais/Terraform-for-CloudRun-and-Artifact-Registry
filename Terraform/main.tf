resource "google_artifact_registry_repository" "your_repository" {
    location = "us-west1" #oregon
    repository_id = "your_repository"
    description = "your_description"
    format = "DOCKER"
}

module "scrapper1"{
  source = "./scrapper1"
}

module "scrapper2"{
  source = "./scrapper2"
}