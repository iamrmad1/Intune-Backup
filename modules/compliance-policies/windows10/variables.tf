variable "display_name" {
  type        = string
  description = "Display name for the compliance policy"
}

variable "description" {
  type        = string
  description = "Description for the compliance policy"
  default     = ""
}

variable "scheduled_actions_for_rule" {
  type        = list(any)
  description = "List of scheduled actions for rule (required by provider)"
}

variable "assignments" {
  type        = list(string)
  description = "List of target group IDs to assign the policy to"
  default     = []
}
