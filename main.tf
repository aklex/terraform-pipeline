data "azurerm_resource_group" "rg" {
  name     = "serviceapp-rg"
}

resource "azurerm_service_plan" "sp" {
  name                = "demoAppServicePlan77"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "appService-3754"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = azurerm_service_plan.sp.location
  service_plan_id     = azurerm_service_plan.sp.id
  site_config {
      application_stack {
        dotnet_version = "6.0"
    }
  }
}

resource "azurerm_linux_web_app_slot" "app_slot" {
  name           = "appService-3754-slot"
  app_service_id = azurerm_linux_web_app.app.id
  
  site_config {
      application_stack {
        dotnet_version = "6.0"
    }
  }
}