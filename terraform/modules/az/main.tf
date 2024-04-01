resource "azurerm_resource_group" "this" {
  name     = "${var.digital_product_affix}-${var.environment}-rg${var.resource_instance_number}"
  location = var.location

  tags = local.tags
}

resource "azurerm_virtual_network" "this" {
  name                = "${var.digital_product_affix}-${var.environment}-vnet${var.resource_instance_number}"
  address_space       = var.virtual_network_address_space
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

resource "azurerm_subnet" "this" {
  name                 = local.vm_subnets[count.index]
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [cidrsubnet("${var.virtual_network_address_space[0]}", 8, (count.index * 2) + 2)]
  count = var.number_of_aks
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_public_ip" "this" {
  name                = local.public_ips[count.index]
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  allocation_method   = "Static"
  sku                 = "Standard"

  count               = var.number_of_aks

  tags = local.tags
}

resource "azurerm_network_security_group" "this" {
  name                = local.vm_network_security_groups[count.index]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  count               = var.number_of_aks

  security_rule {
    name                       = "HTTP_HTTPs"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.this[count.index].id
  network_security_group_id = azurerm_network_security_group.this[count.index].id
  count                     = var.number_of_aks
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = local.aks_names[count.index]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = local.aks_names[count.index]
  count               = var.number_of_aks

  default_node_pool {
    name                = "${var.digital_product_affix}${count.index}"
    node_count          = var.aks_node_count
    vm_size             = var.aks_vm_size
    os_disk_size_gb     = var.aks_os_disk_size_gb
    enable_auto_scaling = var.aks_enable_auto_scaling
    min_count           = var.aks_node_count
    max_count           = var.aks_max_node_count
    vnet_subnet_id      = azurerm_subnet.this[count.index].id
  }

  linux_profile {
    admin_username = var.aks_admin_username
    ssh_key {
      key_data = tls_private_key.this.public_key_openssh
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = local.tags
}