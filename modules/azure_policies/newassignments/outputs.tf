output "policy_assignment_id" {
  description = "The ID of the policy assignment"
  value = coalesce(
    azurerm_management_group_policy_assignment.main[0].id,
    azurerm_subscription_policy_assignment.main[0].id,
    azurerm_resource_group_policy_assignment.main[0].id,
    azurerm_resource_policy_assignment.main[0].id
  )
}

output "policy_assignment_name" {
  description = "The name of the policy assignment"
  value = coalesce(
    azurerm_management_group_policy_assignment.main[0].name,
    azurerm_subscription_policy_assignment.main[0].name,
    azurerm_resource_group_policy_assignment.main[0].name,
    azurerm_resource_policy_assignment.main[0].name
  )
}