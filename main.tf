# Se define el provider
provider "azurerm" {
  features {}
  subscription_id = "05ac627c-5070-4fab-8d59-7eaa35114b1f"
}

# Creo el resource group para mi web app
resource "azurerm_resource_group" "example_anthony" {
  name     = "example_anthony"
  location = "West Europe"
}

# Se define el service plan que tendrá mi maquina virtual
resource "azurerm_service_plan" "example_sp_anthony" {
  name                = "serviceplan_anthony"
  resource_group_name = azurerm_resource_group.example_anthony.name
  location            = azurerm_resource_group.example_anthony.location
  os_type             = "Linux"
  sku_name            = "F1"
}

# Se define el web app
resource "azurerm_linux_web_app" "example_linux_web_app" {
  name                = "webappAnthony"
  resource_group_name = azurerm_resource_group.example_anthony.name
  location            = azurerm_service_plan.example_sp_anthony.location
  service_plan_id     = azurerm_service_plan.example_sp_anthony.id

  site_config {
    
  }

  app_settings = {
    "Google" = "www.google.com",
    "Youtube" = "www.youtube.com"
  }
}