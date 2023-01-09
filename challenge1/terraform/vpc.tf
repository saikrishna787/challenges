resource "google_compute_network" "vpc_network" {
  name                    = "[NETWORK_NAME]"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "app_subnet" {
  name          = "[TIER_1_SUBNET_NAME]"
  ip_cidr_range = "[TIER_1_IP_RANGE]"
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "web_subnet" {
  name          = "[TIER_2_SUBNET_NAME]"
  ip_cidr_range = "[TIER_2_IP_RANGE]"
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "db_subnet" {
  name          = "[TIER_3_SUBNET_NAME]"
  ip_cidr_range = "[TIER_3_IP_RANGE]"
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}