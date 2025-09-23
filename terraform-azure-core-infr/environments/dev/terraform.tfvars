azurerm_resource_group  = {
    rg = {
name = "dev-azure-infra-rg"
locatoion = " Australia East"
    }
}

stg = {
    storage ={
        name = "azureinfrastorageacc"
        locatoion = "Australia East"
        azurerm_resource_group = "dev-azure-infra-rg"
        account_tier = "Standard"
        account_replication_type = "GRS"
        environment = "dev"
    }
}

vnet = {
    vnet = {
        name = "dev-azureinfra-vnet"
        address_space =  ["10.0.0.0/16"]
        locatoion = "Australia East"
        azurerm_resource_group = "dev-azure-infra-rg"
    }
}

subnet = {
    subnet = {
        name = "dev-azureinfra-subnet"
        azurerm_resource_group = "dev-azure-infra-rg"
        virtual_network_name = "azureinfra-vnet"
        address_prefixes = ["10.0.1.0/24"]
    }
}

pip = {
    pip = {
        name = "dev-azureinfra-pip"
        azurerm_resource_group = "dev-azure-infra-rg"
        locatoion = "Australia East"
        allocation_method = "Static"
        environment = "dev-pip"
    }
}

nic = {
     nic = {
name = "dev-azureinfra-nic"
locatoion = "Australia East"
 azurerm_resource_group = "dev-azure-infra-rg"
 name = "dev-azureinfra-ip"
        }

             nic-1 = {
name = "dev-azureinfra-nic-card"
locatoion = "Australia East"
 azurerm_resource_group = "dev-azure-infra-rg"
 name = "dev-azureinfra-ip"
        }
}

vm = {
  vm = {
    name = "dev-azureinfra-vm"
    locatoion = "Australia East"
 azurerm_resource_group = "dev-azure-infra-rg"
 network_interface_ids = azurerm_subnet.internal.id
 vm_size = "Standard_DS1_v2"
 environment = "dev"
  }
}