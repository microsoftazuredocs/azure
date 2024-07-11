# Define Azure Policy definitions
module "policy_definitions" {
  source = "../definitions"
}

# Define Azure Policy initiatives
module "policy_initiatives" {
  source = "../initiatives"
}

# Define Azure Policy assignments
module "policy_assignments" {
  source = "../assignments"
}

# Define Azure Policy exemptions
module "policy_exemptions" {
  source = "../exemptions"
}

module "definitions" {
  source = "../definitions"
}

module "initiatives" {
  source = "../initiatives"
}

module "assignments" {
  source = "../assignments"
}

module "exemptions" {
  source = "../exemptions"
}
