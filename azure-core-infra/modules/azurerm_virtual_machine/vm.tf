resource "azurerm_virtual_machine" "vm" {
  for_each = var.vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = each.value.network_interface_ids
  vm_size               =  each.value.vm_size                                      #"Standard_DS1_v2"


  storage_image_reference {
    publisher = each.value.publisher                                      #"Canonical"
    offer     =   each.value.offer                                                        #"0001-com-ubuntu-server-jammy"
    sku       =   each.value.sku                                                      #"22_04-lts"
    version   =    each.value.version                                                       #"latest"
  }
  storage_os_disk {
    name              =   each.value.name                               #"myosdisk1"
    caching           =   each.value.caching                                           #"ReadWrite"
    create_option     =   each.value.create_option                                    #"FromImage"
    managed_disk_type = each.value.managed_disk_type                                             #"Standard_LRS"
  }
  os_profile {
    computer_name  =  each.value.computer_name                                   #"hostname"
    admin_username =   each.value.admin_username                               #"testadmin"
    admin_password =       each.value.admin_password                                #"Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = each.value.environment
  }
}