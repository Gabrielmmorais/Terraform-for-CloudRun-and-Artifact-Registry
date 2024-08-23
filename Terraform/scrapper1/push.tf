resource "null_resource" "push_docker_image" {
  provisioner "local-exec" {
    command = <<-EOT
      gcloud auth configure-docker us-west1-docker.pkg.dev
      docker push us-west1-docker.pkg.dev/your_project_id/scrapper1/scrapper1:your_tag
    EOT
  }
}