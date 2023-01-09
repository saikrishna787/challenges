resource "google_compute_instance" "app" {
  name         = "app_INSTANCE_NAME"
  machine_type = "MACHINE_TYPE"
  tags         = var.app_tag

  boot_disk {
    initialize_params {
      image = "[IMAGE_NAME]"
    }
  }

  network_interface {
    subnetwork = var.subnetwork

    access_config {
      // Include this section to give the instance a public IP address}
    }

    service_account {
      email  = "[SERVICE_ACCOUNT]"
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
  }
}

resource "google_compute_instance" "web" {
  name         = "web_INSTANCE_NAME"
  machine_type = "MACHINE_TYPE"
  tags         = var.web_tag

  boot_disk {
    initialize_params {
      image = "[IMAGE_NAME]"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.web_subnet.self_link

    access_config {
      // Include this section to give the instance a public IP address}
    }

    service_account {
      email  = "[SERVICE_ACCOUNT]"
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
  }
}

resource "google_compute_instance" "db" {
  name         = "db_INSTANCE_NAME"
  machine_type = "MACHINE_TYPE"
  tags         = var.db_tag

  boot_disk {
    initialize_params {
      image = "[IMAGE_NAME]"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.db_subnet.self_link

    access_config {
      // Include this section to give the instance a public IP address}
    }

    service_account {
      email  = "[SERVICE_ACCOUNT]"
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
  }
}