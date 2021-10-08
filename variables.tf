variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
}

variable "sku_name" {
  type        = string
  description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium. Defaults to `standard`"
  default     = "standard"
}

variable "tenant_id" {
  type        = string
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "access_policy" {
  type = list(any)
  description = "(Optional) A list of up to 16 objects describing access policies."
  default     = []
}

variable "enabled_for_deployment" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
  default     = false
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  default     = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  default     = false
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
  default     = false
}

variable "network_acls" {
  type = list(object({
    bypass                     = string
    default_action             = string
    ip_rules                   = string
    virtual_network_subnet_ids = string
  }))
  description = "(Optional) A network_acls block."
  default     = []
}

variable "purge_protection_enabled" {
  type        = bool
  description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "(Optional) The number of days that items should be retained for once soft-deleted. Defaults to 7."
  default     = 7
}

variable "contact" {
  type = list(object({
    email = string
    name  = string
    phone = string
  }))
  description = "(Optional) One or more contact block."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
