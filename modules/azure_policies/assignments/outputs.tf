output "policy_assignment_ids" {
  description = "The IDs of the created policy assignments."
  value = {
    for key, assignment in azurerm_policy_assignment.assignment : key => assignment.id
  }
}

output "policy_assignment_ids" {
  description = "List of IDs of created policy assignments"
  value       = [for assignment_key, assignment in azurerm_policy_assignment.assignment : assignment.id]
}
