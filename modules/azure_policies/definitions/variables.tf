variable "policy_definitions" {
  description = "Map of policy definitions to be created."
  type        = map(object({
    policy_type  = string
    mode         = string
    display_name = string
    description  = string
    metadata     = map(string)
    policy_rule  = any
    parameters   = map(object({
      type     = string
      metadata = map(string)
    }))
  }))
}
