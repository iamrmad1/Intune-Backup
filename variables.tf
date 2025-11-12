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
  default     = "Windows 10 Compliance Policy"
  description = "Display name"
}

variable "pilot_group_display_name" {
  type        = string
  default     = "Intune - Windows - Pilot"
  description = "Existing Entra ID group to assign policy to"
}
