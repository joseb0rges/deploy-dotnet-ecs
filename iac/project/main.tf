# RDS 
 module "rds" {
  source                  = "../modules/rds"
  region                  = local.AWS_DEFAULT_REGION
  rds_vpc_db_id           = local.AWS_VPC_ID 
  usernamedb              = var.usernamedb
  dbpass                  = var.dbpass
  dbname                  = var.dbname
 }

# ECS
module "ecs" {
  source              = "../modules/ecs"
  name                = "ecs_dotnet"
  replicas_count      = 1
  container_name      = "ecs_dotnet"
  container_image     = "application-dotnet"
  container_cpu       = 10
  container_memory    = 512
  container_essential = true
  container_port      = 8080
  container_host_port = 80
  server = module.rds.db_instance_endpoint_pub
  

}


# ECR REGISTRY

module "ecr" {
  source = "../modules/ecr-repo"
  name = var.name
  
}