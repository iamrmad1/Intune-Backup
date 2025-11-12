// Note: this module keeps the resource minimal to avoid schema mismatches.
// It creates the device compliance policy and attaches assignments if provided.

resource "microsoft365wp_device_compliance_policy" "this" {
  display_name = var.display_name
  description  = var.description

  // provider requires this argument (shape: list of maps)
  scheduled_actions_for_rule = var.scheduled_actions_for_rule

  // assignments expects list of group ids (optional)
  assignments = var.assignments
}
