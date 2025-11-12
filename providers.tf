// providers.tf

terraform {
  required_version = ">= 0.17.1"

  required_providers {
    microsoft365wp = {
      source  = "terraprovider/microsoft365wp"
      version = "~> 0.1"
    }
  }
}

provider "microsoft365wp" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
  # If you prefer certificate auth, replace client_secret with:
  # client_certificate          = var.client_certificate
  # client_certificate_password = var.client_certificate_password
}
