# The network module
module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# The compute module
module "compute" {
  source = "./modules/compute"
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  app_ami = var.app_ami
  instance_type = var.instance_type
  alb_listener_port = var.alb_listener_port
}

# The database module
module "database" {
  source = "./modules/database"
  create_db = var.create_db
  db_subnet_ids = module.network.private_subnet_ids
  vpc_id = module.network.vpc_id
}
