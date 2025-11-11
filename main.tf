provider "microsoft365wp" {
  client_id     = var.client_id
  client_secret = var.client_secret
  tenant_id     = var.tenant_id
}

data "microsoft365wp_device_configuration_policies" "all" {}

output "intune_config_policies" {
  value = data.microsoft365wp_device_configuration_policies.all.policies
}
