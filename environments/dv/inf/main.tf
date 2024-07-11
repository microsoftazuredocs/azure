# module "azure_policies" {
#   source = "git::https://github.com/your-org/Enterprise.Terraform.Modules.git//modules/azure_policies"

#   policy_definitions = {
#     "SQLServerFirewallPolicy" = {
#       display_name = "Restrict IP address for Azure SQL Server"
#       description  = "Restrict IP address for Azure SQL Server"
#       policy_rule  = <<POLICY_RULE
# {
#   "if": {
#     "allOf": [
#       {
#         "field": "type",
#         "equals": "Microsoft.Sql/servers/firewallRules"
#       },
#       {
#         "not": {
#           "field": "Microsoft.Sql/servers/firewallRules/startIpAddress",
#           "in": "[parameters('allowedIPAddresses')]"
#         }
#       },
#       {
#         "not": {
#           "field": "Microsoft.Sql/servers/firewallRules/endIpAddress",
#           "in": "[parameters('allowedIPAddresses')]"
#         }
#       }
#     ]
#   },
#   "then": {
#     "effect": "deny"
#   }
# }
# POLICY_RULE
#       metadata = {
#         createdBy = "123566352-sdf78-sdfs-77965824a85a"
#         createdOn = "2024-06-10T21:47:35.2722043Z"
#       }
#       parameters = {}
#     }
#   }

#   policy_initiatives = {}

#   policy_assignments = {}

#   policy_exemptions = {}
# }


module "azure_policies" {
  source = "git::https://github.com/your-org/Enterprise.Terraform.Modules.git//modules/azure_policies"

  policy_definitions = {
    "SQLServerFirewallPolicy" = {
      display_name = "Restrict IP address for Azure SQL Server"
      description  = "Restrict IP address for Azure SQL Server"
      policy_rule  = <<POLICY_RULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Sql/servers/firewallRules"
      },
      {
        "not": {
          "field": "Microsoft.Sql/servers/firewallRules/startIpAddress",
          "in": "${join(",", var.allowed_ip_addresses)}"
        }
      },
      {
        "not": {
          "field": "Microsoft.Sql/servers/firewallRules/endIpAddress",
          "in": "${join(",", var.allowed_ip_addresses)}"
        }
      }
    ]
  },
  "then": {
    "effect": "deny"
  }
}
POLICY_RULE
      metadata = {
        createdBy = "123566352-sdf78-sdfs-77965824a85a"
        createdOn = "2024-06-10T21:47:35.2722043Z"
      }
      parameters = {}
    }
  }

  policy_initiatives = {}

  policy_assignments = {}

  policy_exemptions = {}
}