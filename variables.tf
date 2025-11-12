variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "client_id" {
  type        = string
  description = "App registration (client) ID"
}

variable "client_secret" {
  type        = string
  sensitive   = true
  description = "Client secret for the app registration"
}

variable "policy_name" {
  type        = string
  description = "Display name for the Windows 10 compliance policy"
  default     = "Windows 10 Compliance Policy"
}

variable "pilot_group_display_name" {
  type        = string
  description = "Existing Entra ID group display name to assign the policy to (optional)"
  default     = ""
}
