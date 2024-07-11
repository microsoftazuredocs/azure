variable "policy_exemptions" {
  description = "A map of policy exemptions to be created."
  type = map(object({
    scope                = string
    policy_definition_id = string
    description          = string
    expiration_date      = string
    exempt_actions       = list(string)
  }))
}