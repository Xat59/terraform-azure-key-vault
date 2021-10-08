# terraform-azure-key-vault

Terraform module to manage an [`Azure Key Vault`](https://docs.microsoft.com/en-us/azure/key-vault/).

![Terraform Version](https://img.shields.io/badge/Terraform-%3E=%200.12.0-green)

See `variables.tf` for more information about input values.

## Usage

```hcl
module "kv" {
  source = "github.com/Xat59/terraform-azure-key-vault"

  location              = "francecentral"
  resource_group_name   = "rg-project1-francecentral"
  name                  = "kv-sslauto-02"
  sku_name              = "standard"

  tenant_id       = "xxxx"

  soft_delete_retention_days  = 30

  tags = {
    environment = "dev"
    client      = "scalair"
    terraform   = "true"
  }
}
```
