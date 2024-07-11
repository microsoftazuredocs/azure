output "policy_exemption_ids" {
  description = "The IDs of the created policy exemptions."
  value = {
    for key, exemption in azurerm_policy_exemption.exemption : key => exemption.id
  }
}

output "exemption_ids" {
  description = "The IDs of the created policy exemptions."
  value       = azurerm_policy_exemption.exemption[*].id
}
