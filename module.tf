resource "azurerm_public_ip" "pip" {
  for_each = var.pip_objects

  name                    = "${var.prefix}-${each.value.name}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = lookup(each.value, "allocation_method", "Dynamic")
  sku                     = lookup(each.value, "sku", "Basic")
  ip_version              = lookup(each.value, "ip_version", "IPv4")

  idle_timeout_in_minutes = lookup(each.value, "idle_timeout_in_minutes", null)
  domain_name_label       = lookup(each.value, "domain_name_label", random_string.domain_name_label.result)
  reverse_fqdn            = lookup(each.value, "reverse_fqdn", null)

  tags                    = local.tags
  zones                   = lookup(each.value, "zones", null)
}

resource "random_string" "domain_name_label" {
  length = 60
  lower = true
  upper = false
  number = false
  special = false
}