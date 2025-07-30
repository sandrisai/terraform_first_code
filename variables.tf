variable "vpc_subnet" {
    type = object({
      vpc_cid = string
      vpc_tag = string
      subnets = object({
        sub_cid = list(string)
        sub_avz = list(string)
        sub_tag = list(string)
      })
      gate = string
      route_cid = string
    
    })
    
    
  
}