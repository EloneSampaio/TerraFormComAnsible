#Security group
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = var.aws_security_group
  description = "Security group for example usage with EC2 instance"
  //vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp","https-443-tcp","ssh-tcp"]
  computed_ingress_rules = ["ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.tags
}