resource "google_cloud_run_service_iam_binding" "invoker-bb" {
  location    = google_cloud_run_service.scrapper1.location
  project     = google_cloud_run_service.scrapper1.project
  service     = google_cloud_run_service.scrapper1.name
  role        = "roles/run.invoker"
  members     = [
    "user:your_user or your_service_account"
    #"allUsers"
  ]
}

resource "google_cloud_run_service_iam_binding" "invoker-siop" {
  location    = google_cloud_run_service.scrapper2.location
  project     = google_cloud_run_service.scrapper2.project
  service     = google_cloud_run_service.scrapper2.name
  role        = "roles/run.invoker"
  members     = [
    "user:gyour_user or your_service_account"
    #"allUsers"
  ]
}