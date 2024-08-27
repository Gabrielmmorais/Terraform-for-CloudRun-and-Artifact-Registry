resource "null_resource" "push_docker_image" {
  provisioner "local-exec" {
    command = <<-EOT
      gcloud auth configure-docker us-west1-docker.pkg.dev
      docker docker buildx build --platform linux/amd64 -t scrapper1:v1 -f scrapper1/app/Dockerfile .
      docker tag scrapper1:v1 us-west1-docker.pkg.dev/your_project_id/scrapper1/scrapper1:your_tag
      docker push us-west1-docker.pkg.dev/your_project_id/scrapper1/scrapper1:your_tag
    EOT
  }
}