resource "google_pubsub_topic" "topic" {
  name = var.topic_name
}

resource "google_cloud_scheduler_job" "job" {
  name        = var.schedule_name
  description = var.schedule_name
  schedule    = var.schedule

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("test")
  }
}


