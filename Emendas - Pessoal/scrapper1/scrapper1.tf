resource "google_cloud_run_service" "scrapper1" {
  name     = "scrapper1"
  location = "us-west1"

  template {
    spec {
      containers {
        image = "us-west1-docker.pkg.dev/your_project_id/scrapper1/scrapper1:your_tag"
        ports {
          container_port = 8080
        }
        resources {
          limits = {
            memory = "5Gi"
            cpu= "2"
          }
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  
#To ensure that the service only continues after the image push
  depends_on = [null_resource.push_docker_image]
}