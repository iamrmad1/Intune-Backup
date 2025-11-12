// main.tf

// 1) Create an Entra ID security group for device targeting
resource "microsoft365wp_group" "win_pilot" {
  display_name     = var.device_group_name
  description      = "Pilot group for Windows device configuration"
  mail_nickname    = "win_pilot_group"
  security_enabled = true
  mail_enabled     = false
}

// 2) Create a Windows device configuration policy (example CSP)
resource "microsoft365wp_configuration_policy" "win_disable_consumer" {
  name        = "WIN - Disable Consumer Features"
  description = "Disables consumer experiences on Windows devices"
  platform    = "windows10AndLater" // platform identifiers follow Intune Graph formats
  category    = "deviceConfiguration"

  // Example OMA-URI setting (CSP). Adjust as needed for your baseline.
  settings = [
    {
      // DisableConsumerFeatures: https://docs.microsoft.com/windows/client-management/mdm/policy-csp-experience
      oma_uri  = "./Device/Vendor/MSFT/Policy/Config/Experience/AllowConsumerFeatures"
      data_type = "integer"
      value     = "0"
    }
  ]
}

// 3) Assign the policy to the group
resource "microsoft365wp_configuration_policy_assignment" "win_disable_consumer_assign" {
  policy_id = microsoft365wp_configuration_policy.win_disable_consumer.id
  target {
    type     = "group"
    group_id = microsoft365wp_group.win_pilot.id
  }
}
