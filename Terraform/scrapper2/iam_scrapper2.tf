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