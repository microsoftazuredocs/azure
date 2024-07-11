# Data source for fetching Azure Policy Definitions
data "azurerm_policy_definition" "example" {
  display_name = "Allowed resource types"
}

# Data source for fetching Azure Policy Set Definitions
data "azurerm_policy_set_definition" "example" {
  display_name = "Policy Set Definition Example"
}

# Data source for fetching Azure Policy Initiatives
data "azurerm_policy_initiative" "example" {
  display_name = "Example Initiative"
}

# Data source for fetching Azure Policy Assignments
data "azurerm_policy_assignment" "example" {
  name     = "existing"
  scope_id = data.azurerm_resource_group.example.id
}

output "id" {
  value = data.azurerm_policy_assignment.example.id
}

# Data source for fetching Azure Policy Exemptions
data "azurerm_policy_exemption" "example" {
  name = "Example Exemption"
}
