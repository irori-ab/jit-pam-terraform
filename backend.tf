terraform {
  backend "gcs" {
    bucket      = "jit-pam-demo"
    prefix      = "tofu/state"
  }
}