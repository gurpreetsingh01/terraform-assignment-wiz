module "vpc" {
  source              = "./vpc"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "testing-vpc"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}


module "ec2" {
  source            = "./ec2"
  instance_count    = 1
  ami              = "ami-04b4f1a9cf54c11d0"
  instance_type     = "t2.micro"
  subnet_id        = module.vpc.public_subnet_ids[0]
  security_group_id = "sg-04e6b4c94c3257fb9"
  instance_name    = "vizh_web_server"
}