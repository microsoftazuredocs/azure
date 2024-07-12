variable "assignment_name" {
  description = "The name of the policy assignment"
  type        = string
}

variable "policy_definition_id" {
  description = "The ID of the policy definition"
  type        = string
}

variable "scope" {
  description = "The scope at which the policy will be assigned. This can be a management group, subscription, or resource."
  type        = string
}

variable "resource_group_id" {
  description = "The ID of the resource group for resource group level assignment"
  type        = string
  default     = null
}

variable "location" {
  description = "The location where the policy assignment will be applied"
  type        = string
  default     = null
}

variable "parameters" {
  description = "Parameters for the policy assignment"
  type        = map(any)
  default     = {}
}

variable "description" {
  description = "Description of the policy assignment"
  type        = string
  default     = null
}

variable "assignment_scope" {
  description = "The specific scope for the policy assignment (management_group, subscription, resource_group, resource)"
  type        = string
}
