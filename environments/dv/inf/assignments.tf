module "azure_policy_assignments" {
  source = "git::https://github.com/your-org/Enterprise.Terraform.Modules.git//modules/azure_policies/assignments"

  policy_assignments = {
    "RestrictSQLServerAccessAssignment" = {
      display_name         = "Restrict SQL Server Access Assignment"
      scope                = "/subscriptions/12345678-1234-1234-1234-123456789abc"
      description          = "Assigns the Restrict SQL Server Access policy"
      policy_definition_id = "/providers/Microsoft.Management/managementGroups/00a2f2d9-1d7b-4a75-abd1-0c6463653806b/providers/Microsoft.Authorization/policyDefinitions/ed735451-2384-4afaf-b29b-7865hu5452qa"
      parameters = {
        allowedIPAddresses = {
          value = ["0.0.0.0"]
        }
      }
      location = "East US"
    }
  }
}