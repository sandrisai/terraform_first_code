resource "aws_vpc" "VPC1"{
    cidr_block = var.vpc_subnet.vpc_cid
    tags = {
        Name = var.vpc_subnet.vpc_tag
    }
  
}
resource "aws_subnet" "SUB" {
    count = length(var.vpc_subnet.subnets)
    vpc_id = aws_vpc.VPC1.id
    cidr_block = var.vpc_subnet.subnets.sub_cid[count.index]
    availability_zone =var.vpc_subnet.subnets.sub_avz[count.index]
    tags = {
      Name = var.vpc_subnet.subnets.sub_tag[count.index]
    }
  
}
resource "aws_internet_gateway" "IGW"{
    vpc_id = aws_vpc.VPC1.id
    tags = {
      Name = var.vpc_subnet.gate
    }
  
}
resource "aws_route_table" "ROUTE" {
    vpc_id = aws_vpc.VPC1.id

    route {
        cidr_block = var.vpc_subnet.route_cid
        gateway_id = aws_internet_gateway.IGW.id
    }
  
}
resource "aws_route_table_association" "asso" {
    subnet_id = aws_subnet.SUB[0].id
    route_table_id = aws_route_table.ROUTE.id
  
}

resource "aws_security_group" "SG" {
    vpc_id = aws_vpc.VPC1.id
    tags = {
      Name = "sg"
    }
  
}
resource "aws_vpc_security_group_ingress_rule" "SGI" {
    security_group_id = aws_security_group.SG.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    
  
}
resource "aws_vpc_security_group_egress_rule" "SGE" {
    security_group_id = aws_security_group.SG.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
  
}

resource "aws_instance" "launch" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    key_name = "sainathkey"
    subnet_id = aws_subnet.SUB[0].id
    vpc_security_group_ids = [ aws_security_group.SG.id ]
    tags = {
      Name = "launch ec2"
    }
  
}

  
