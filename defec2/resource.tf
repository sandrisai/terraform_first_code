# coonecting the ec2 instance with existed vpc
data "aws_subnet" "ex_sub" {

    filter {
        name = "tag:Name"
        values = [ "mysubnet2" ]

      }
  
}

data "aws_security_group" "SSg" {
    filter {
      name = "tag:Name"
      values = ["sg" ]
    }
   # vpc_id = data.aws_subnet.ex_sub.vpc_id
  
}

resource "aws_instance" "lll" {
    ami =  "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    key_name="sainathkey"
    subnet_id = data.aws_subnet.ex_sub.id
    vpc_security_group_ids = [ data.aws_security_group.SSg.id ]

    tags = {
      Name = "existed_vpc"
    }
  
}