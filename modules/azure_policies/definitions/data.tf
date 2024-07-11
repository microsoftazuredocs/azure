data "azurerm_policy_definitions" "existing" {
  depends_on = [module.azuread_applications]

  names = var.policy_definitions_names
}

data "azurerm_policy_definition" "example" {
  name = "allowed-resource-types"

  depends_on = [
    azurerm_policy_definition.definition
  ]
}