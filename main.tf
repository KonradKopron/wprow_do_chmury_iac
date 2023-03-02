provider "google" {
  region  = var.gcp_region
  
}

resource "google_compute_address" "static" {
  name = "shop"
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name 
  auto_create_subnetworks = false
}
 
resource "google_compute_subnetwork" "public-subnetwork" {
  name          = var.subnet_name 
  ip_cidr_range = "10.0.2.0/24"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance" "shop" {
  name = "shop"
  zone = var.gcp_zone
  tags = ["allow-http"]
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id

    access_config {
      nat_ip = google_compute_address.static.address
    }
    subnetwork = google_compute_subnetwork.public-subnetwork.id
  }

  metadata_startup_script = file("startup_script.sh")
}

resource "google_compute_firewall" "allow_http" {
    name = "allow-http-rule2"
    network = google_compute_network.vpc_network.id
    
    allow {
      ports = ["80"]
      protocol = "tcp"
    }

    target_tags = ["allow-http"]

    priority = 1000
  
}

output "public_ip_address" {
  value = google_compute_address.static.address
}