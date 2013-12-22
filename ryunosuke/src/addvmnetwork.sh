#!/bin/bash
TENANT_NAME="demo"
TENANT_NETWORK_NAME="demo-net"
TENANT_SUBNET_NAME="${TENANT_NETWORK_NAME}-subnet"
TENANT_ROUTER_NAME="demo-router"
FIXED_RANGE="10.0.0.0/24"
NETWORK_GATEWAY="10.0.0.1"
TENANT_ID=$(keystone tenant-list | grep " $TENANT_NAME " | awk '{print $2}')

TENANT_NET_ID=$(quantum net-create --tenant_id $TENANT_ID $TENANT_NETWORK_NAME --provider:network_type gre  --provider:segmentation_id 1 | grep " id " | awk '{print $4}')
TENANT_SUBNET_ID=$(quantum subnet-create --tenant_id $TENANT_ID --ip_version 4 --name $TENANT_SUBNET_NAME $TENANT_NET_ID $FIXED_RANGE --gateway $NETWORK_GATEWAY --dns_nameservers list=true 8.8.8.8 | grep " id " | awk '{print $4}')
ROUTER_ID=$(quantum router-create --tenant_id $TENANT_ID $TENANT_ROUTER_NAME | grep " id " | awk '{print $4}')
quantum router-interface-add $ROUTER_ID $TENANT_SUBNET_ID

