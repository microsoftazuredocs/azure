# main.tf
module "policy_initiatives" {
  source = "./modules/policy_initiatives"

  policy_initiatives = {
    initiative1 = {
      display_name = "Example Initiative 1"
      policy_type  = "Custom"
      description  = "An example policy initiative 1"
      metadata = {
        category = "General"
        version  = "1.0.0"
      }
      parameters = {
        param1 = {
          type     = "String"
          metadata = {
            displayName = "Parameter 1"
          }
        }
      }
      policy_definitions = {
        policy1 = {
          policy_definition_id = "/subscriptions/12345678-1234-1234-1234-123456789012/providers/Microsoft.Authorization/policyDefinitions/Policy1"
          parameter_values     = {
            param1 = "value1"
          }
        }
      }
    },
    initiative2 = {
      display_name = "Example Initiative 2"
      policy_type  = "BuiltIn"
      description  = "An example policy initiative 2"
      metadata = {
        category = "Security"
        version  = "2.0.0"
      }
      parameters = {
        param2 = {
          type     = "Boolean"
          metadata = {
            displayName = "Parameter 2"
          }
        }
      }
      policy_definitions = {
        policy2 = {
          policy_definition_id = "/subscriptions/12345678-1234-1234-1234-123456789012/providers/Microsoft.Authorization/policyDefinitions/Policy2"
          parameter_values     = {
            param2 = true
          }
        }
      }
    }
  }
}

output "policy_set_definition_ids" {
  value = module.policy_initiatives.policy_set_definition_ids
}


#########################
#####################

# main.tf
module "policy_initiatives" {
  source = "./modules/policy_initiatives"

  policy_initiatives = {
    initiative1 = {
      display_name = "Initiative 1"
      policy_type  = "Custom"
      description  = "Description for initiative 1"
      metadata = {
        category = "General"
      }
      parameters = {
        allowedLocations = {
          type = "Array"
          metadata = {
            description = "The list of allowed locations for resources."
            displayName = "Allowed locations"
            strongType  = "location"
          }
        }
      }
      policy_definitions = {
        policy1 = {
          policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
          parameter_values = {
            listOfAllowedLocations = {
              value = "[parameters('allowedLocations')]"
            }
          }
        }
      }
    },
    initiative2 = {
      display_name = "Initiative 2"
      policy_type  = "Custom"
      description  = "Description for initiative 2"
      metadata = {
        category = "Security"
      }
      parameters = {
        allowedSKUs = {
          type = "Array"
          metadata = {
            description = "The list of allowed SKUs for resources."
            displayName = "Allowed SKUs"
          }
        }
      }
      policy_definitions = {
        policy2 = {
          policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a27b5cfc-8654-4c9e-b73c-3c08e5bba25c"
          parameter_values = {
            listOfAllowedSKUs = {
              value = ["Standard_B1ls", "Standard_B2s"]
            }
          }
        }
      }
    }
  }
}

output "policy_set_definition_ids" {
  value = module.policy_initiatives.policy_set_definition_ids
}
