locals {
  is_management_group = var.assignment_scope == "management_group"
  is_subscription     = var.assignment_scope == "subscription"
  is_resource_group   = var.assignment_scope == "resource_group"
  is_resource         = var.assignment_scope == "resource"
  policy_definition_id = azurerm_policy_definition.policy_definitions.id
}

resource "azurerm_management_group_policy_assignment" "main" {
  count                = local.is_management_group ? 1 : 0
  name                 = var.assignment_name
  policy_definition_id = var.policy_definition_id
  management_group_id  = var.scope
  location             = var.location
  parameters           = var.parameters
  description          = var.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_subscription_policy_assignment" "main" {
  count                = local.is_subscription ? 1 : 0
  name                 = var.assignment_name
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.scope
  location             = var.location
  parameters           = var.parameters
  description          = var.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_resource_group_policy_assignment" "main" {
  count                = local.is_resource_group ? 1 : 0
  name                 = var.assignment_name
  policy_definition_id = var.policy_definition_id
  resource_group_id    = var.scope
  location             = var.location
  parameters           = var.parameters
  description          = var.description

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_resource_policy_assignment" "main" {
  count                = local.is_resource ? 1 : 0
  name                 = var.assignment_name
  policy_definition_id = var.policy_definition_id
  resource_id          = var.scope # Specify the resource_id here
  location             = var.location
  parameters           = var.parameters
  description          = var.description

  lifecycle {
    create_before_destroy = true
  }
}

