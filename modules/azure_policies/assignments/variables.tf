# variable "assignment_name" {
#   description = "The name of the policy assignment."
#   type        = string
# }

# variable "policy_definition_id" {
#   description = "The ID of the policy definition."
#   type        = string
# }

# variable "scope_type" {
#   description = "The type of scope for the policy assignment. Options: management_group, subscription, resource_group, resource."
#   type        = string
# }

# variable "scope_id" {
#   description = "The ID of the scope (management group, subscription, resource group, or resource) where the policy will be assigned."
#   type        = string
# }

# variable "parameters" {
#   description = "The parameters for the policy assignment."
#   type        = map(any)
#   default     = {}
# }

# variable "description" {
#   description = "A description of the policy assignment."
#   type        = string
#   default     = null
# }

# variable "display_name" {
#   description = "The display name of the policy assignment."
#   type        = string
#   default     = null
# }

# variable "enforce" {
#   description = "Specifies if this policy should be enforced or not. Defaults to true."
#   type        = bool
#   default     = true
# }

variable "policy_assignments" {
  description = "A map of policy assignments to be created."
  type = map(object({
    display_name         = string
    scope                = string
    description          = string
    policy_definition_id = string
    parameters           = map(any)
    location             = string
  }))
}