variable "policy_definitions" {
  description = "Map of Azure Policy definitions."
  type        = map(object({
    display_name = string
    description  = string
    policy_rule  = string
    metadata     = map(string)
    parameters   = map(any)
  }))
}

variable "policy_initiatives" {
  description = "Map of Azure Policy initiatives."
  type        = map(object({
    display_name = string
    description  = string
    policy_definitions = list(string)
    metadata     = map(string)
    parameters   = map(any)
  }))
}

variable "policy_assignments" {
  description = "Map of Azure Policy assignments."
  type        = map(object({
    scope                    = string
    policy_definition_id     = string
    display_name             = string
    description              = string
    metadata                 = map(string)
    parameters               = map(any)
    enforcement_mode         = string
    assignment_identity_type = string
    identity_ids             = list(string)
  }))
}

variable "policy_exemptions" {
  description = "Map of Azure Policy exemptions."
  type        = map(object({
    scope                = string
    policy_definition_id = string
    description          = string
    expiration_date      = string
    exempt_actions       = list(string)
  }))
}








variable "management_group_name" {
  description = "Name of the Azure management group where the policies will be applied."
  type        = string
  default     = ""  # Set a default if applicable
}

variable "subscription_id" {
  description = "ID of the Azure subscription where the policies will be applied."
  type        = string
  default     = ""  # Set a default if applicable
}

variable "policy_definitions" {
  description = "Map of policy definitions to be created."
  type        = map(object({
    display_name = string
    policy_type  = string
    description  = string
    metadata     = map(string)
    policy_rule  = any
    parameters   = map(string)
  }))
}

variable "policy_initiatives" {
  description = "Map of policy initiatives to be created."
  type        = map(object({
    display_name = string
    policy_type  = string
    description  = string
    metadata     = map(string)
    parameters   = map(string)
    policy_definitions = map(object({
      policy_definition_id = string
      parameter_values     = map(string)
    }))
  }))
}

variable "policy_assignments" {
  description = "Map of policy assignments to be created."
  type        = map(object({
    display_name         = string
    scope                = string
    description          = string
    policy_definition_id = string
    parameters           = map(any)
    location             = string
  }))
}

variable "policy_exemptions" {
  description = "Map of policy exemptions to be created."
  type        = map(object({
    scope                = string
    policy_definition_id = string
    description          = string
    expiration_date      = string
    exempt_actions       = list(string)
  }))
}
