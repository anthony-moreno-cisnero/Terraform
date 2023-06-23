# Se define el provider
provider "azurerm" {
  features {}
  subscription_id = "05ac627c-5070-4fab-8d59-7eaa35114b1f"
}

# Si no esta creado el resourse group se debe crear previamente
# Se define el service plan que tendrá mi maquina virtual
resource "azurerm_service_plan" "example_sp_anthony" {
  name                = "serviceplan_anthony"
  resource_group_name = "Terraform-Anthony"
  location            = "West US"
  os_type             = "Linux"
  sku_name            = "B1"
}

# Se define el web app
resource "azurerm_linux_web_app" "example_linux_web_app" {
  name                = "webappAnthony"
  resource_group_name = "Terraform-Anthony"
  location            = "West US"
  service_plan_id     = azurerm_service_plan.example_sp_anthony.id

  site_config {
    
  }

  app_settings = {
    "Google" = "www.google.com",
    "Youtube" = "www.youtube.com"
  }
}