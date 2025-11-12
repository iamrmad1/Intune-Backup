// variables.tf

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

variable "device_group_name" {
  type        = string
  description = "Target Entra ID group for device assignments"
  default     = "Intune - Windows - Pilot"
}
