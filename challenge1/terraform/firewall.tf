resource "google_compute_firewall" "allow_app_web" {
  name    = "app_web"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["app_IP_RANGE"]
  target_tags   = ["web_TAG"]
}

resource "google_compute_firewall" "allow_web_db" {
  name    = "web_db"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["web_IP_RANGE"]
  target_tags   = ["db_TAG"]
}