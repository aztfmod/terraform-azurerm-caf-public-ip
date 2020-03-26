provider azurecaf {}

provider azurerm {
  features {}
}


data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "rg_test" {
  name     = local.resource_groups.test.name
  location = local.resource_groups.test.location
  tags     = local.tags
}

module "la_test" {
  # source  = "aztfmod/caf-log-analytics/azurerm"
  # version = "1.0.0"
  source = "git://github.com/aztfmod/terraform-azurerm-caf-log-analytics?ref=2003-refresh" 

    convention          = local.convention
    location            = local.location
    name                = local.name
    solution_plan_map   = local.solution_plan_map 
    prefix              = local.prefix
    resource_group_name = azurerm_resource_group.rg_test.name
    tags                = local.tags
}

module "diags_test" {
  # source  = "aztfmod/caf-diagnostics-logging/azurerm"
  # version = "1.0.0"
  source = "git://github.com/aztfmod/terraform-azurerm-caf-diagnostics-logging?ref=2003-refresh"

  convention            = local.convention
  name                  = local.name
  resource_group_name   = azurerm_resource_group.rg_test.name
  prefix                = local.prefix
  location              = local.location
  tags                  = local.tags
  enable_event_hub      = local.enable_event_hub
}

module "public_ip_test" {
  source = "../../"

  convention                       = local.convention
  name                             = local.ip_addr_config.ip_name
  location                         = local.location
  resource_group_name              = azurerm_resource_group.rg_test.name
  ip_addr                          = local.ip_addr_config
  tags                             = local.tags
  diagnostics_map                  = module.diags_test.diagnostics_map
  log_analytics_workspace_id       = module.la_test.id
  diagnostics_settings             = local.ip_addr_config.diagnostics
}
