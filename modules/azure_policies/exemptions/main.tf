locals {
  exemptions = var.policy_exemptions
}

resource "azurerm_policy_exemption" "exemption" {
  for_each = local.exemptions

  name                 = each.key
  scope                = each.value.scope
  policy_definition_id = each.value.policy_definition_id
  description          = each.value.description
  expiration_date      = each.value.expiration_date
  exempt_actions       = each.value.exempt_actions

  # Optionally, you may want to add timeouts for operations
  timeouts {
    create = "30m"
    update = "30m"
  }
}
