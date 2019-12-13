# Required resources to test the module
resource "azurerm_resource_group" "test" {
  name     = var.resource_groups.rg1.name
  location = var.resource_groups.rg1.location
}


# Testing the module
module "test_pip" {
  source = "../.."

  prefix              = var.prefix
  tags                = var.tags
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  pip_objects         = var.pip_objects.pips

}

