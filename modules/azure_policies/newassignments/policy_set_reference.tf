resource "azurerm_policy_set_definition" "example" {
  name         = "testPolicySet"
  policy_type  = "Custom"
  display_name = "Test Policy Set"
  description  = "This is a test policy set definition"
  management_group_id = "/providers/Microsoft.Management/managementGroups/yourManagementGroup"

  metadata = <<METADATA
  {
    "category": "General",
    "createdBy": "admin@example.com",
    "version": "1.0.0"
  }
  METADATA

  parameters = <<PARAMETERS
  {
    "allowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed locations",
        "strongType": "location"
      }
    }
  }
  PARAMETERS

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
    parameter_values     = <<VALUE
    {
      "listOfAllowedLocations": {"value": "[parameters('allowedLocations')]" }
    }
    VALUE
    reference_id = "locationPolicyRef"
    policy_group_names = ["group1"]
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a27b5cfc-8654-4c9e-b73c-3c08e5bba25c"
    parameter_values     = <<VALUE
    {
      "listOfAllowedSKUs": {"value": ["Standard_B1ls", "Standard_B2s"] }
    }
    VALUE
    reference_id = "skuPolicyRef"
    policy_group_names = ["group2"]
  }

  policy_definition_group {
    name         = "group1"
    display_name = "Location Policies"
    category     = "Location"
    description  = "Policies related to allowed locations"
    additional_metadata_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/metadataRG/providers/Microsoft.Storage/storageAccounts/metadataStorage"
  }

  policy_definition_group {
    name         = "group2"
    display_name = "SKU Policies"
    category     = "SKU"
    description  = "Policies related to allowed SKUs"
  }

  timeouts {
    create = "30m"
    update = "30m"
    read   = "5m"
    delete = "30m"
  }
}