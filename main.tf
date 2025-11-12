// Create a Windows 10 compliance policy
resource "microsoft365wp_device_compliance_policy" "win10" {
  display_name = var.policy_name
  platform     = "windows10AndLater"

  // Example compliance settings
  password_required                = true
  password_minimum_length           = 8
  password_required_type            = "alphanumeric"
  password_expiration_days          = 90
  password_minutes_of_inactivity    = 15
  password_previous_password_block_count = 5

  os_minimum_version = "10.0.19045.0" // Example: require Windows 10 22H2
  os_maximum_version = "10.0.99999.0" // Optional upper bound
}
