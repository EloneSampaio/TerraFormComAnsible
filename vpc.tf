
#Vpc aws
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"] //regios de disponibilidade
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  create_database_subnet_group = true
  create_database_internet_gateway_route = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }
 # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []
  tags = local.tags
  vpc_tags = {
    Name = "vpc-luaibase"
  }
}