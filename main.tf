resource "microsoft365wp_device_compliance_policy" "win10" {
  display_name = var.policy_name
  description  = "Windows 10 compliance baseline"

  // Required block: scheduled actions
  scheduled_actions_for_rule {
    rule_name = "PasswordRequired"

    scheduled_action_configurations {
      action_type = "block"
      grace_period_hours = 0
    }
  }

  // Platform-specific settings go inside settings blocks
  settings {
    setting_name  = "passwordRequired"
    setting_value = "true"
  }

  settings {
    setting_name  = "passwordMinimumLength"
    setting_value = "8"
  }

  settings {
    setting_name  = "passwordRequiredType"
    setting_value = "alphanumeric"
  }

  settings {
    setting_name  = "osMinimumVersion"
    setting_value = "10.0.19045.0"
  }
}
