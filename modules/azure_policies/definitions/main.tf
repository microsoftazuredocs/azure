locals {
  policy_definitions = var.policy_definitions
}

resource "azurerm_policy_definition" "policy_definitions" {
  for_each = local.policy_definitions

  name         = each.key
  policy_type  = each.value.policy_type
  mode         = each.value.mode
  display_name = each.value.display_name
  description  = each.value.description
  metadata     = jsonencode(each.value.metadata)
  policy_rule  = jsonencode(each.value.policy_rule)
  parameters   = jsonencode(each.value.parameters)
}