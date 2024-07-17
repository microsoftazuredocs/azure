module "azure_policies" {
  source = "../path/to/azure_policies"

  policy_definitions = {
    RestrictIPForAzureSQLServer = {
      policy_type  = "Custom"
      mode         = "Indexed"
      display_name = "Restrict IP for Azure SQL Server"
      description  = "Restrict IP for Azure SQL Server"

      metadata = <<METADATA
{
  "category": "General"
}
METADATA

      policy_rule = <<POLICY_RULE
{
  "if": {
    "not": {
      "field": "location",
      "in": "[parameters('allowedLocations')]"
    }
  },
  "then": {
    "effect": "audit"
  }
}
POLICY_RULE

      parameters = <<PARAMETERS
{
  "allowedLocations": {
    "type": "Array",
    "metadata": {
      "description": "The list of allowed locations for resources.",
      "displayName": "Allowed locations",
      "strongType": "location"
    }
  },
  "allowed_ip_addresses": {
    "type": "Array",
    "metadata": {
      "description": "List of allowed IP addresses",
      "displayName": "Allowed IP addresses"
    },
    "value": ${jsonencode(var.allowed_ip_addresses)}
  }
}
PARAMETERS
    }
  }

  allowed_ip_addresses = ["192.168.1.1", "192.168.1.2", "192.168.1.3", "192.168.1.4"]
}
