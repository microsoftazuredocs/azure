# Azure Policies Module

This module manages Azure Policy resources including definitions, initiatives, assignments, and exemptions.

## Usage

1. **Definitions**: Add Azure Policy definitions using `policy_definitions` module.
2. **Initiatives**: Create Azure Policy initiatives using `policy_initiatives` module.
3. **Assignments**: Assign policies using `policy_assignments` module.
4. **Exemptions**: Define exemptions using `policy_exemptions` module.

## Inputs

- `policy_definitions`: Map of Azure Policy definitions.
- `policy_initiatives`: Map of Azure Policy initiatives.
- `policy_assignments`: Map of Azure Policy assignments.
- `policy_exemptions`: Map of Azure Policy exemptions.

## Outputs

- `policy_definition_ids`: Map of Azure Policy definition IDs.
- `policy_initiative_ids`: Map of Azure Policy initiative IDs.
- `policy_assignment_ids`: Map of Azure Policy assignment IDs.
- `policy_exemption_ids`: Map of Azure Policy exemption IDs.
