resource "google_artifact_registry_repository" "your_repository" {
    location = "us-west1" #oregon
    repository_id = "your_repository"
    description = "your_description"
    format = "DOCKER"
}

#To push your docker image local for gcp artifact registry
resource "null_resource" "push_docker_image"{
    provisioner "local-exec" {
        command = <<-EOT
            gcloud auth  configure-docker us-west1-docker.pkg.dev
            docker push us-west1-docker.pkg.dev/your_project/your_image/your_image:tag
        EOT
      
    }
}

resource "google_cloud_run_service" "default" {
    name = "your_cloud_run_service"
    location = "us-west1"

    template {
      spec {
        containers {
          image = "us-west1-docker.pkg.dev/your/image/path"
          ports {
            container_port = 8080
          }
          #Defining storage resources
          resources {
            limits = {
              memory = "5Gi"
              cpu = "2"
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
      percent = 100
      latest_revision = true
    }
    
    #To ensure that the service only continues after the image push
    depends_on = [ null_resource.push_docker_image ]
  
}

resource "google_cloud_run_service_iam_binding" "invoker" {
    location = google_cloud_run_service.default.location
    project = google_cloud_run_service.default.project
    service = google_cloud_run_service.default.name
    role = "roles/run.invoker"
    members = [
        "your service account or your personal email for the service"
    ]
    
  
}