output "policy_initiative_ids" {
  description = "The IDs of the created policy initiatives."
  value = {
    for key, initiative in azurerm_policy_set_definition.initiative : key => initiative.id
  }
}

output "initiative_ids" {
  description = "Map of initiative IDs created"
  value       = azurerm_policy_set_definition.initiative[*].id
}

output "initiative_names" {
  description = "List of initiative names created"
  value       = [for key, value in local.initiatives : value.display_name]
}
