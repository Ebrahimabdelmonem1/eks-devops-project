module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = "dev"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}


#######################################
module "eks" {
  source = "./modules/eks"

  project_name = var.project_name
  environment  = "dev"

  cluster_name = "${var.project_name}-eks"

  kubernetes_version = "1.33"

  private_subnet_ids = module.vpc.private_subnet_ids

  node_instance_types = [
    "t3.small"
  ]

  desired_nodes = 2
  min_nodes     = 2
  max_nodes     = 4
}

######################################
module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  environment  = "dev"
}
########################################
module "rds" {
  source = "./modules/rds"

  project_name = var.project_name
  environment  = "dev"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  eks_node_security_group_id = module.eks.cluster_security_group_id

  database_name     = "devops"
  database_username = "devops"
  database_password = var.database_password

  instance_class = "db.t3.micro"
}
#############################################