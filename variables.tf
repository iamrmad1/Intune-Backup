// variables.tf
variable "tenant_id"      { type = string }
variable "client_id"      { type = string }
variable "client_secret"  { type = string, sensitive = true }

variable "device_group_name" {
  type        = string
  description = "Target Entra ID group for device assignments"
  default     = "Intune - Windows - Pilot"
}
