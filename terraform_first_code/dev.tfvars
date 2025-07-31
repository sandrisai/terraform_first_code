vpc_subnet = {
      vpc_cid ="10.0.0.0/16"
      vpc_tag ="myvpc"
      subnets = {
        sub_cid = [ "10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24" ]
        sub_avz = [ "ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1a"]
        sub_tag = ["mysubnet1","mysubnet2","mysubnet3","mysubnet4"]
      }
      gate = "igw"
      route_cid = "0.0.0.0/0"
    }