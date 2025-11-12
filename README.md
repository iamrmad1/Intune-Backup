Terraform layout to create a Windows 10 device compliance policy (module-based).

- Root contains provider, versions, and module wiring.
- Module modules/compliance-policies/windows10 contains the compliance policy resource.

Usage:
1. Copy terraform.tfvars.example to terraform.tfvars and fill values.
2. terraform init
3. terraform validate
4. terraform plan -out plan.tfplan
5. terraform apply plan.tfplan

Notes:
- This repo expects the terraprovider/microsoft365wp provider to be configured with an app registration that has appropriate Graph permissions.
- The module keeps the resource minimal: display_name + scheduled_actions_for_rule + optional assignments.
