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

  // Compliance settings are passed as JSON-style maps
  settings = [
    {
      setting_name  = "passwordRequired"
      setting_value = "true"
    },
    {
      setting_name  = "passwordMinimumLength"
      setting_value = "8"
    },
    {
      setting_name  = "passwordRequiredType"
      setting_value = "alphanumeric"
    },
    {
      setting_name  = "osMinimumVersion"
      setting_value = "10.0.19045.0"
    }
  ]
}
