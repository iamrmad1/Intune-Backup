// Fetch pilot group ID if user provided a display name
data "microsoft365wp_groups" "pilot" {
  count        = var.pilot_group_display_name != "" ? 1 : 0
  display_name = var.pilot_group_display_name
}

module "win10_compliance_policy" {
  source = "./modules/compliance-policies/windows10"

  display_name = var.policy_name
  description  = "Windows 10 compliance baseline - pilot"

  # Minimal required scheduled actions structure (adjust as needed)
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

  # If pilot group exists, pass the ID, otherwise empty list
  assignments = length(data.microsoft365wp_groups.pilot) > 0 ? [data.microsoft365wp_groups.pilot[0].id] : []
}
