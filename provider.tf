terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "5.10.0"
    }
    google-beta = {
        source = "hashicorp/google-beta"
        version = "5.10.0"
    }
  }
}

provider "google" {
    credentials = file("your_secret_json")
    project = var.project_id
    region = "us-west1"
    zone = "us-west1-a" 
}

provider "google-beta" {
    credentials = file("your_secret_json")
    project = var.project_id
    region = "us-west1"
    zone = "us-west1-a" 
  
}