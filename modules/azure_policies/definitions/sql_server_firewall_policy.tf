module "policy_definitions_sql_server_firewall" {
  source = "../definitions"

  policy_definitions = {
    RestrictIPForAzureSQLServer = {
      display_name = "Restrict IP address for Azure SQL Server"
      policy_type  = "Custom"
      mode         = "All"
      description  = "Restrict IP address for Azure SQL Server"
      metadata = jsonencode({
        createdBy = "123566352-sdf78-sdfs-77965824a85a"
        createdOn = "2024-06-10T21:47:35.2722043Z"
      })
      version = "1.0.0"
      parameters = jsonencode({
        allowedIPAddresses = {
          type = "Array"
          metadata = {
            displayName = "Allowed IP Addresses"
            description = "The list of allowed IP addresses."
          }
        }
      })
      policy_rule = jsonencode({
        "if" = {
          "allOf" = [
            {
              "field"  = "type"
              "equals" = "Microsoft.Sql/servers/firewallRules"
            },
            {
              "not" = {
                "field" = "Microsoft.Sql/servers/firewallRules/startIpAddress"
                "in"    = "[parameters('allowedIPAddresses')]"
              }
            },
            {
              "not" = {
                "field" = "Microsoft.Sql/servers/firewallRules/endIpAddress"
                "in"    = "[parameters('allowedIPAddresses')]"
              }
            }
          ]
        },
        "then" = {
          "effect" = "Deny"
        }
      })
    }
  }
}