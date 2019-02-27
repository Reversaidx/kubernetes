
variable "project" {
  default = "the-hard-way-232407"
}
variable "REGION" {
  default = "europe-north1-a"
}

// Configure the Google Cloud provider
provider "google" {
  project = "${var.project}"
  region  = "${var.REGION}"
}