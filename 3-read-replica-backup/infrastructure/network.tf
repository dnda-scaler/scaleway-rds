# with private network and dhcp configuration
resource scaleway_vpc_private_network pn02 {
    name = "my-private-network"
}

resource scaleway_vpc_public_gateway_dhcp main {
    subnet = "192.168.1.0/24"
    dns_local_name = "my-private-network"
}
resource scaleway_vpc_public_gateway_ip main {
}

resource scaleway_vpc_public_gateway main {
    name = "foobar"
    type = "VPC-GW-S"
    ip_id = scaleway_vpc_public_gateway_ip.main.id
    bastion_enabled = true
}
resource scaleway_vpc_gateway_network main {
    gateway_id = scaleway_vpc_public_gateway.main.id
    private_network_id = scaleway_vpc_private_network.pn02.id
    dhcp_id = scaleway_vpc_public_gateway_dhcp.main.id
    cleanup_dhcp = true
    enable_masquerade = true
    depends_on = [scaleway_vpc_public_gateway_ip.main, scaleway_vpc_private_network.pn02]

}