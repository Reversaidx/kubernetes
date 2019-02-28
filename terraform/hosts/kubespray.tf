resource "google_compute_instance" "master" {
  name         = "${format("master%03d", count.index + 1)}"
  count        = "2"
  machine_type = "n1-standard-1"
  zone         = "${var.ZONE}"

  boot_disk {
    initialize_params {
      image = "ubuntu-1810-cosmic-v20190212"
      size  = 20
    }
  }

  network_interface {
    subnetwork = "default"

    access_config {}
  }

  scheduling {
    preemptible = "true"
     automatic_restart = "false"
  }

  labels = {
    terraform = "true"
  }
}

resource "google_compute_instance" "worker" {
  name         = "${format("worker%03d", count.index + 1)}"
  count        = "2"
  machine_type = "n1-standard-1"
  zone         = "${var.ZONE}"

  boot_disk {
    initialize_params {
      image = "ubuntu-1810-cosmic-v20190212"
      size  = 20
    }
  }

  scheduling {
    preemptible = "true"
    automatic_restart = "false"
  }

  network_interface {
    subnetwork = "default"

    access_config {}
  }

  labels = {
    terraform = "true"
  }
}
