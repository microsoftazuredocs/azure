module "policy_set_definitions" {
  source = "./modules/policy_set_definition"

  policy_initiatives = var.policy_initiatives
}

# Define the variables in the root module
variable "policy_initiatives" {
  description = "A map of policy initiatives to create"
  type = map(any)
}

# Example of calling the root module with input data
provider "azurerm" {
  features {}
}

variable "policy_initiatives" {
  default = {
    "initiative1" = {
      display_name     = "Initiative 1"
      policy_type      = "Custom"
      description      = "Description for initiative 1"
      metadata         = {
        "category" = "General"
      }
      parameters       = {
        "allowedLocations" = {
          "type" = "Array"
          "metadata" = {
            "description"  = "The list of allowed locations for resources."
            "displayName"  = "Allowed locations"
            "strongType"   = "location"
          }
        }
      }
      policy_definitions = {
        "policy1" = {
          policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
          parameter_values = {
            "listOfAllowedLocations" = {
              "value" = "[parameters('allowedLocations')]"
            }
          }
        }
      }
    }
    "initiative2" = {
      display_name     = "Initiative 2"
      policy_type      = "Custom"
      description      = "Description for initiative 2"
      metadata         = {
        "category" = "Security"
      }
      parameters       = {
        "allowedSKUs" = {
          "type" = "Array"
          "metadata" = {
            "description"  = "The list of allowed SKUs for resources."
            "displayName"  = "Allowed SKUs"
          }
        }
      }
      policy_definitions = {
        "policy2" = {
          policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a27b5cfc-8654-4c9e-b73c-3c08e5bba25c"
          parameter_values = {
            "listOfAllowedSKUs" = {
              "value" = ["Standard_B1ls", "Standard_B2s"]
            }
          }
        }
      }
    }
  }