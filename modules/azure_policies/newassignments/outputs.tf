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



output "policy_assignment_id" {
  description = "The ID of the policy assignment"
  value = coalesce(
    try(azurerm_management_group_policy_assignment.main[0].id, null),
    try(azurerm_subscription_policy_assignment.main[0].id, null),
    try(azurerm_resource_group_policy_assignment.main[0].id, null),
    try(azurerm_resource_policy_assignment.main[0].id, null)
  )
}

output "policy_assignment_name" {
  description = "The name of the policy assignment"
  value = coalesce(
    try(azurerm_management_group_policy_assignment.main[0].name, null),
    try(azurerm_subscription_policy_assignment.main[0].name, null),
    try(azurerm_resource_group_policy_assignment.main[0].name, null),
    try(azurerm_resource_policy_assignment.main[0].name, null)
  )
}


output "policy_assignment_id" {
  description = "The ID of the policy assignment"
  value = var.scope == "management_group" && azurerm_management_group_policy_assignment.main.exists() ? azurerm_management_group_policy_assignment.main[0].id :
         var.scope == "subscription" && azurerm_subscription_policy_assignment.main.exists() ? azurerm_subscription_policy_assignment.main[0].id :
         var.scope == "resource_group" && azurerm_resource_group_policy_assignment.main.exists() ? azurerm_resource_group_policy_assignment.main[0].id :
         var.scope == "resource" && azurerm_resource_policy_assignment.main.exists() ? azurerm_resource_policy_assignment.main[0].id : null
}

# Similar approach for policy_assignment_name output...
output "policy_assignment_id" {
  description = "The ID of the policy assignment"
  value = lookup(
    {
      "management_group": azurerm_management_group_policy_assignment.main.id,
      "subscription": azurerm_subscription_policy_assignment.main.id,
      "resource_group": azurerm_resource_group_policy_assignment.main.id,
      "resource": azurerm_resource_policy_assignment.main.id,
    },
    var.scope,
    null
  )
}

# Similar approach for policy_assignment_name output...
