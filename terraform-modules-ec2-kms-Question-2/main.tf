provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "existing" {
  id = "vpc-034df1630b0dbb138" 
}

data "aws_subnet" "existing" {
  id = "subnet-014966a29dd41fc04" 
}
module "kms" {
  source = "./modules/kms"
  alias  = "vizh-key"
}

module "security_group" {
  source = "./modules/security_group"
  name   = "ec2-ssh-sg"
  vpc_id = data.aws_vpc.existing.id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["86.41.9.209/32"] # Replace with your home IP
    }
  ]
}

module "ec2" {
  source              = "./modules/ec2"
  ami                 = "ami-04b4f1a9cf54c11d0"
  instance_type       = "t2.micro"
  key_name            =  "testing-machine-kms"
  kms_key_id          = module.kms.key_arn
  security_group_ids  = [module.security_group.security_group_id]
  iam_instance_profile = module.iam.instance_profile_name
  subnet_id          =   data.aws_subnet.existing.id 
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "vizh-testing-bucket-wiz" 
  
}

module "iam" {
  source = "./modules/iam"
  role_name              = "ec2_service_role"
  policy_name            = "restricted_policy"
  policy_description     = "Policy to restrict access to specific EC2 and S3 resources"
  instance_profile_name  = "ec2_instance_profile"

policy_statements = [
    {
      Effect   = "Allow"
      Action   = "ec2:*"
      Resource = [module.ec2.instance_arn]
    },
    {
      Effect   = "Allow"
      Action   = "s3:*"
      Resource = [
        module.s3.bucket_arn,
        "${module.s3.bucket_arn}/*"
      ]
    }
  ]
}

