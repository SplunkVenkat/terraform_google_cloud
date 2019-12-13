provider "google" {
  credentials = "${file("${var.credentials}")}"
  project = "${var.gcp_project}"
  region  = "${var.region}"
  zone    = "asia-south1-c"
}
