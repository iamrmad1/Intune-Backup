output "policy_id" {
  description = "ID of the created compliance policy"
  value       = microsoft365wp_device_compliance_policy.this.id
}

output "policy_name" {
  description = "Display name returned"
  value       = microsoft365wp_device_compliance_policy.this.display_name
}
