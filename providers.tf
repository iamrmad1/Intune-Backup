terraform {
  required_version = ">= 1.7.0"

  required_providers {
    microsoft365wp = {
      source  = "terraprovider/microsoft365wp"
      version = "~> 0.17.1"
    }
  }
}
provider "microsoft365wp" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
