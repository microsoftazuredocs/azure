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
