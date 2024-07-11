data "azurerm_management_group" "example" {
  name = var.management_group_name
}

data "azurerm_subscription" "example" {
  subscription_id = var.subscription_id
}

data "azurerm_policy_definition" "example" {
  for_each = var.policy_definitions

  name = each.key
  # Optionally, you can restrict to a specific management group
  # management_group_id = data.azurerm_management_group.example.id

  depends_on = [azurerm_management_group.example]
}