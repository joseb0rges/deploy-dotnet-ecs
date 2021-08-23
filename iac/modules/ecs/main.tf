# Custom ECS Provider

module "ecs_cluster" {
  source = "./cluster"
  name   = var.name
}

module "ecs_task_definition" {
  source              = "./task_definition"
  //environment         = var.environment
  container_name      = var.container_name
  container_image     = var.container_image
  container_cpu       = var.container_cpu
  container_memory    = var.container_memory
  container_essential = var.container_essential
  container_port      = var.container_port
  container_host_port = var.container_host_port
  dbname = var.dbname
  usernamedb = var.usernamedb
  server = var.server
  dbpass = var.dbpass
  
}

module "ecs_service" {
  source              = "./service"
  name                = var.name
  replicas_count      = var.replicas_count
  cluster_id          = module.ecs_cluster.aws_ecs_cluster_output.arn
  task_definition_arn = module.ecs_task_definition.aws_ecs_task_definition_output.arn
}






