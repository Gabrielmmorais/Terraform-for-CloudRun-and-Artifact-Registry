resource "google_artifact_registry_repository" "your_repository" {
    location = "us-west1" #oregon
    repository_id = "your_repository"
    description = "your_description"
    format = "DOCKER"
}

#To push your docker image local for gcp artifact registry
resource "null_resource" "push_docker_image" {
  provisioner "local-exec" {
    command = <<-EOT
      gcloud auth configure-docker us-west1-docker.pkg.dev
      docker push us-west1-docker.pkg.dev/your_project_id/scrapper1/scrapper1:your_tag
    EOT
  }
  provisioner "local-exec" {
    command = <<-EOT
      gcloud auth configure-docker us-west1-docker.pkg.dev
      docker push us-west1-docker.pkg.dev/your_project_id/scrapper2/scrapper2:your_tag
    EOT
  }
}
