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

  // Settings must be passed as a list of maps
  settings = [
    {
      name  = "passwordRequired"
      value = "true"
    },
    {
      name  = "passwordMinimumLength"
      value = "8"
    },
    {
      name  = "passwordRequiredType"
      value = "alphanumeric"
    },
    {
      name  = "osMinimumVersion"
      value = "10.0.19045.0"
    }
  ]
}
