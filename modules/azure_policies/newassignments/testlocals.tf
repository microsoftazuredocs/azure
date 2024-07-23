variable "policy_assignments" {
  description = "A map of policy assignments to be created."
  type = map(object({
    display_name             = string
    scope                    = string
    description              = string
    policy_definition_id     = string
    policy_assignment_name   = string
    parameters               = map(any)
    location                 = string
    policy_assignment_scope  = string
  }))
}

locals {
  policy_assignments_map = var.policy_assignments

  # Boolean conditions
  has_management_group_assignments = length({
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "management_group" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }) > 0

  has_subscription_assignments = length({
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "subscription" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }) > 0

  has_resource_group_assignments = length({
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "resource_group" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }) > 0

  has_resource_assignments = length({
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "resource" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }) > 0

  # Filtered maps based on the conditions
  management_group_assignments = {
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "management_group" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }

  subscription_assignments = {
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "subscription" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }

  resource_group_assignments = {
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "resource_group" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }

  resource_assignments = {
    for k, v in var.policy_assignments : k => v
    if v.policy_assignment_scope == "resource" && v.policy_assignment_name != "" && v.policy_definition_id != ""
  }

  policy_definition_id = azurerm_policy_definition.policy_definitions.id
}

resource "azurerm_management_group_policy_assignment" "main" {
  for_each = local.has_management_group_assignments ? local.management_group_assignments : {}

  name                 = each.value.policy_assignment_name
  policy_definition_id = local.policy_definition_id
  management_group_id  = each.value.scope
  location             = each.value.location
  parameters           = each.value.parameters
  description          = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_subscription_policy_assignment" "main" {
  for_each = local.has_subscription_assignments ? local.subscription_assignments : {}

  name                 = each.value.policy_assignment_name
  policy_definition_id = local.policy_definition_id
  subscription_id      = each.value.scope
  location             = each.value.location
  parameters           = each.value.parameters
  description          = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_resource_group_policy_assignment" "main" {
  for_each = local.has_resource_group_assignments ? local.resource_group_assignments : {}

  name                 = each.value.policy_assignment_name
  policy_definition_id = local.policy_definition_id
  resource_group_name  = each.value.scope
  location             = each.value.location
  parameters           = each.value.parameters
  description          = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_policy_assignment" "main" {
  for_each = local.has_resource_assignments ? local.resource_assignments : {}

  name                 = each.value.policy_assignment_name
  policy_definition_id = local.policy_definition_id
  scope                = each.value.scope
  location             = each.value.location
  parameters           = each.value.parameters
  description          = each.value.description

  lifecycle {
    create_before_destroy = true
  }
}
