locals {
  assignments = var.policy_assignments
}

locals {
  assignments = var.policy_assignments

  # Check if there are any initiatives present
  has_initiative = length(keys(var.policy_assignments)) > 0
}

resource "azurerm_policy_assignment" "assignment" {
  for_each = local.assignments

  name                 = each.key
  display_name         = each.value.display_name
  scope                = each.value.scope
  description          = each.value.description
  policy_definition_id = each.value.policy_definition_id
  parameters           = jsonencode(each.value.parameters)
  location             = each.value.location

  depends_on = [azurerm_policy_set_definition.initiative]  # Adjust this based on your actual dependency

  # Optionally, you may want to add timeouts for operations
  timeouts {
    create = "30m"
    update = "30m"
  }
}

# 
resource "azurerm_policy_assignment" "assignment" {
  for_each = local.assignments

  name                 = each.key
  display_name         = each.value.display_name
  scope                = each.value.scope
  description          = each.value.description
  policy_definition_id = each.value.policy_definition_id
  parameters           = jsonencode(each.value.parameters)
  location             = each.value.location

  # Adjust depends_on based on the presence of initiatives
  depends_on = local.has_initiative ? [azurerm_policy_set_definition.initiative[each.key]] : []

  # Optionally, set timeouts for create and update operations
  timeouts {
    create = "30m"
    update = "30m"
  }
}