terraform {
  required_version = ">= 0.12.0"
}

resource "azurerm_key_vault" "kv" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  tenant_id = var.tenant_id

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  dynamic "access_policy" {
    for_each = var.access_policy

    content {
      tenant_id      = var.tenant_id
      object_id      = access_policy.value.object_id
      application_id = lookup(access_policy.value, "application_id", null)

      certificate_permissions = lookup(access_policy.value, "certificate_permissions", null)
      key_permissions         = lookup(access_policy.value, "key_permissions", null)
      secret_permissions      = lookup(access_policy.value, "secret_permissions", null)
      storage_permissions     = lookup(access_policy.value, "storage_permissions", null)
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls

    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }

  dynamic "contact" {
    for_each = var.contact

    content {
      email = contact.value.email
      name  = contact.value.name
      phone = contact.value.phone
    }
  }

  tags = var.tags
}
