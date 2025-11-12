resource "microsoft365wp_device_compliance_policy" "win10" {
  display_name = var.policy_name
  description  = "Windows 10 compliance baseline"

  // Required argument: scheduled_actions_for_rule
  scheduled_actions_for_rule = [
    {
      rule_name = "PasswordRequired"
      scheduled_action_configurations = [
        {
          action_type        = "block"
          grace_period_hours = 0
        }
      ]
    }
  ]

  // Supported arguments vary by platform; here’s a Windows example
  password_required              = true
  password_minimum_length        = 8
  password_required_type         = "alphanumeric"
  password_expiration_days       = 90
  password_minutes_of_inactivity = 15
  password_previous_password_block_count = 5

  os_minimum_version = "10.0.19045.0"  # Require Windows 10 22H2
}
