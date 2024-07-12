variable "policy_initiatives" {
  description = "Map of policy initiatives to create"
  type = map(object({
    display_name = string
    policy_type  = string
    description  = string
    metadata     = map(string)
    parameters = map(object({
      type     = string
      metadata = map(string)
    }))
    policy_definitions = map(object({
      policy_definition_id = string
      parameter_values     = map(any)
    }))
  }))
}

variable "management_group_name" {
  description = "Name of the Azure management group where the initiatives will be applied."
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "ID of the Azure subscription where the initiatives will be applied."
  type        = string
  default     = ""
}

variable "policy_definitions" {
  description = "Map of policy definitions to be created."
  default     = {}
  type = map(object({
    display_name = string
    policy_type  = string
    description  = string
    metadata     = map(string)
    policy_definitions = map(object({
      policy_definition_id = string
      parameter_values     = map(string)
    }))
  }))
}
