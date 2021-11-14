# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}
module "Module" {
  source = "./Module"
  name = "Test_Resource_MA"
  location = "East US"
  prefix = "SU_Test5_prefix"
}