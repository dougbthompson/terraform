
variable "newvariable" {
  type = "string"
  default = "thisisvalue"
}

variable "maptype" {
  type = "map"
  default = {
    subnet1 = "subnet1"
    subnet2 = "subnet2"
    subnet3 = "bettersubnetname3"
  }
}

variable "listtype" {
  type = "list"
  default = ["item1", "item2"]
}

variable aws_ip_cidr_range {
  default = "10.0.1.0/24"
  type = "string"
  description = "IP CIDR Range for AWS VPC."
}

variable subnet_names {
  type = "map"

  default = {
    subnet1 = "subnetone"
    subnet2 = "subnettwo"
    subnet3 = "subnetthree"
  }
}

