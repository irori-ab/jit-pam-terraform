terraform {
  required_providers {
    google = {
      source = "opentofu/google"
      version = "6.1.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
}

resource "google_storage_bucket" "demo_static_site" {
  name          = "jit-pam-demo-bucket"
  location      = "europe-north1"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_object" "index" {
  name   = "index.html"
  
  content_type = "text/html; charset=utf-8"
  cache_control = "public, max-age=60"

  content = <<-EOT
  <html>
    <body>
      <h1>JIT! PAM!</h1>
      <p>Ka-pow! Tjoff!</p>
    </body>
  </html>
  EOT



  bucket = google_storage_bucket.demo_static_site.id
}

resource "google_storage_bucket_iam_member" "public_rule" {
  bucket = google_storage_bucket.demo_static_site.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}