variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "availability_zones" { type = list(string) }