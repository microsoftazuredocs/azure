module "azure_policy_exemptions" {
  source = "git::https://github.com/your-org/Enterprise.Terraform.Modules.git//modules/azure_policies/exemptions"

  policy_exemptions = {
    "ExampleExemption" = {
      scope                = "/subscriptions/12345678-1234-1234-1234-123456789abc"
      policy_definition_id = "/providers/Microsoft.Management/managementGroups/00a2f2d9-1d7b-4a75-abd1-0c6463653806b/providers/Microsoft.Authorization/policyDefinitions/ed735451-2384-4afaf-b29b-7865hu5452qa"
      description          = "Exempts resources from Restrict SQL Server Access policy"
      expiration_date      = "2025-07-31"
      exempt_actions       = ["Microsoft.Sql/servers/firewallRules/write"]
    }
  }
}