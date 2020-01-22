data "azurerm_client_config" "current" {
}

module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

module "la_test" {
  source  = "aztfmod/caf-log-analytics/azurerm"
  version = "1.0.0"
  
    convention          = local.convention
    location            = local.location
    name                = local.name
    solution_plan_map   = local.solution_plan_map 
    prefix              = local.prefix
    resource_group_name = module.rg_test.names.test
    tags                = local.tags
}

module "diags_test" {
  source  = "aztfmod/caf-diagnostics-logging/azurerm"
  version = "1.0.0"

  convention            = local.convention
  name                  = local.name
  resource_group_name   = module.rg_test.names.test
  prefix                = local.prefix
  location              = local.location
  tags                  = local.tags
}

module "public_ip_test" {
  source = "../../"

  convention                       = local.convention
  name                             = local.ip_addr_config.ip_name
  location                         = local.location
  rg                               = module.rg_test.names.test
  ip_addr                          = local.ip_addr_config
  tags                             = local.tags
  diagnostics_map                  = module.diags_test.diagnostics_map
  log_analytics_workspace_id       = module.la_test.id
  diagnostics_settings             = local.ip_addr_config.diagnostics
}
