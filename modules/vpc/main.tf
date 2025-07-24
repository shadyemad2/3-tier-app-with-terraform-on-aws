resource "aws_vpc" "vpc_shady" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name = "${var.project_name}-vpc"
    } 
}

##### igw ######
resource "aws_internet_gateway" "igw_shady" {
    vpc_id = aws_vpc.vpc_shady.id
    tags = {
      Name ="${var.project_name}-igw"
    }
}

#### public subs ####
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc_shady.id
    count = length(var.public_subnets_cidrs)
    availability_zone = var.availability_zones[count.index]
    cidr_block = var.public_subnets_cidrs[count.index]
    map_public_ip_on_launch = true
    tags = {
      Name ="${var.project_name}-public-sub-${count.index +1}"
    }  
}

#### private subs ####
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc_shady.id
    count = length(var.private_subnets_cidrs)
    availability_zone = var.availability_zones[count.index]
    cidr_block = var.private_subnets_cidrs[count.index]
    tags = {
      Name ="${var.project_name}-private-sub-${count.index +1}"
    }  
}

##### eip ######
resource "aws_eip" "shady_eip" {
    tags = {
      Name ="${var.project_name}-eip"
    }
}
##### nat ######
resource "aws_nat_gateway" "shady_nat" {
    allocation_id = aws_eip.shady_eip.id
    subnet_id = aws_subnet.public_subnet[0].id
    tags = {
      Name ="${var.project_name}-nat-gateway"
    }
}

##### public route tables ######
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc_shady.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_shady.id
    }
    tags = {
      Name ="${var.project_name}-public-route-table"
    }
}

##### public route associate ######
resource "aws_route_table_association" "public_route_associate" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

##### private route tables ######
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc_shady.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.shady_nat.id
    }
    tags = {
      Name ="${var.project_name}-private-route-table"
    }
}

##### private route associate ######
resource "aws_route_table_association" "private_route_associate" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}