// Fetch existing pilot group id
data "microsoft365wp_groups" "pilot" {
  display_name = var.pilot_group_display_name
}

// Use the quickstart compliance policy module (Windows 10)
module "win10_compliance_policy" {
  source = "github.com/terraprovider/terraform-provider-microsoft365wp-quickstart//compliance-policies/windows10?ref=main"

  display_name = var.policy_name
  description  = "Windows 10 compliance baseline via quickstart module"

  // Core compliance settings (module variables)
  password_required               = true
  password_minimum_length         = 8
  password_required_type          = "alphanumeric"
  password_expiration_days        = 90
  password_minutes_of_inactivity  = 15
  password_previous_password_block_count = 5
  os_minimum_version              = "10.0.19045.0"

  // Enforcement actions when non-compliant
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

  // Assignments: pass group IDs
  assignments = [data.microsoft365wp_groups.pilot.id]
}
