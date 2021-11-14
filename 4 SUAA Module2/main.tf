# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}
module "Module" {
  source           = "./Module"
  node_location    = "UK South"
  node_location-uk = "UK South"
  node_location-ny = "East US"
  node_location-sg = "Southeast Asia"
  resource_prefix  = "linuxnode"
  Environment      = "Terraform"
  node_count       = 2
}