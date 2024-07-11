output "policy_definition_ids" {
  description = "Map of Azure Policy definition IDs."
  value = {
    for key, definition in module.policy_definitions.policy_definition : key => definition.id
  }
}

output "policy_initiative_ids" {
  description = "Map of Azure Policy initiative IDs."
  value = {
    for key, initiative in module.policy_initiatives.policy_initiative : key => initiative.id
  }
}

output "policy_assignment_ids" {
  description = "Map of Azure Policy assignment IDs."
  value = {
    for key, assignment in module.policy_assignments.policy_assignment : key => assignment.id
  }
}

output "policy_exemption_ids" {
  description = "Map of Azure Policy exemption IDs."
  value = {
    for key, exemption in module.policy_exemptions.policy_exemption : key => exemption.id
  }
}

output "policy_definition_ids" {
  description = "IDs of all created Azure Policy Definitions."
  value       = module.definitions.policy_definition_ids
}

output "policy_initiative_ids" {
  description = "IDs of all created Azure Policy Initiatives."
  value       = module.initiatives.policy_initiative_ids
}

output "policy_assignment_ids" {
  description = "IDs of all created Azure Policy Assignments."
  value       = module.assignments.policy_assignment_ids
}

output "policy_exemption_ids" {
  description = "IDs of all created Azure Policy Exemptions."
  value       = module.exemptions.policy_exemption_ids
}
