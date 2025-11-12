resource "microsoft365wp_device_compliance_policy" "win10" {
  display_name = var.policy_name
  description  = "Windows 10 compliance baseline"
  platform     = "windows10AndLater"

  // Required: scheduled actions
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

  // Example supported arguments
  password_required       = true
  password_minimum_length = 8
  os_minimum_version      = "10.0.19045.0"
}
