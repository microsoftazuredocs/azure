output "policy_definition_ids" {
  description = "IDs of the created Azure policy definitions"
  value       = azurerm_policy_definition.policy_definitions[*].id
}

output "policy_definition_names" {
  description = "Names of the created Azure policy definitions"
  value       = azurerm_policy_definition.policy_definitions[*].name
}

output "policy_definition_display_names" {
  description = "Display names of the created Azure policy definitions"
  value       = azurerm_policy_definition.policy_definitions[*].display_name
}

output "policy_definition_metadata" {
  description = "Metadata of the created Azure policy definitions"
  value       = azurerm_policy_definition.policy_definitions[*].metadata
}