module "azure_policy_initiatives" {
  source = "git::https://github.com/your-org/Enterprise.Terraform.Modules.git//modules/azure_policies/initiatives"

  policy_initiatives = {
    "RestrictSQLServerAccess" = {
      display_name = "Restrict SQL Server Access"
      policy_type  = "Custom"
      description  = "Initiative to restrict access to SQL Servers"
      metadata = {
        createdBy  = "123566352-sdf78-sdfs-77965824a85a"
        createdOn  = "2024-06-10T21:47:35.2722043Z"
      }
      version = "1.0.0"
      parameters = {}
      policy_definitions = [
        {
          policy_definition_id = "/providers/Microsoft.Management/managementGroups/00a2f2d9-1d7b-4a75-abd1-0c6463653806b/providers/Microsoft.Authorization/policyDefinitions/ed735451-2384-4afaf-b29b-7865hu5452qa"
          parameters = {
            allowedIPAddresses = {
              value = ["0.0.0.0"]
            }
          }
        }
      ]
    }
  }
}