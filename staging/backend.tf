### Object Storage
terraform {
    backend "http" {
      address = "{URL}"
      update_method = "PUT"
    }
}
