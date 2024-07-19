# modules/policy_set_definition/main.tf
locals {
  initiatives = var.policy_initiatives
}

resource "azurerm_policy_set_definition" "initiative" {
  for_each = local.initiatives

  name         = each.key
  display_name = each.value.display_name
  policy_type  = each.value.policy_type
  description  = each.value.description
  metadata     = jsonencode(each.value.metadata)

  parameters = jsonencode(each.value.parameters)

  dynamic "policy_definition_reference" {
    for_each = each.value.policy_definitions

    content {
      policy_definition_id = policy_definition_reference.value.policy_definition_id
      parameter_values     = jsonencode(policy_definition_reference.value.parameter_values)
    }
  }
}

# modules/policy_set_definition/variables.tf
variable "policy_initiatives" {
  description = "A map of policy initiatives to create"
  type        = map(any)
}
