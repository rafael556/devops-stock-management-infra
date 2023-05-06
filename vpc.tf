module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  cidr                   = "10.0.0.0/16"
  create_igw             = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  name                   = "eks-vps"

  azs                 = ["${local.region}a", "${local.region}b"]
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_names = ["sub-1-pb", "sub-2-pb"]

  private_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]
  private_subnet_names = ["sub-3-pv", "sub-4-pv"]
}