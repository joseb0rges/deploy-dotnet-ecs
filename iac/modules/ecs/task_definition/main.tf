resource "aws_ecs_task_definition" "task" {
  family = "service"
  container_definitions = jsonencode([
    {
      "name"        : var.container_name
      "image"       : var.container_image
      "cpu"         : var.container_cpu
      "memory"      : var.container_memory
      "essential"   : var.container_essential
      "environment" : [
        {
          "name": "User ID",
          "value": var.usernamedb
        },
         {
          "name": "Password",
          "value": var.dbpass
        },
         {
          "name": "Server",
          "value": var.server 
        },
         {
          "name": "Port",
          "value": "5432" 
        },
        {
          "name": "Database",
          "value": var.dbname 
        },
        {
          "name": "Security",
          "value": "true" 
        },
        {
          "name": "Pooling",
          "value": "true" 
        }

      ],
      "portMappings" : [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    },
    {
      name      = "nginx"
      image     = "nginx"
      essential = true
      cpu       = 10
      memory    = 128
      links     = ["${var.container_name}"]
      portMappings = [
        {
          hostPort      = var.container_host_port
          containerPort = var.container_host_port
          protocol      = "tcp"
        }
      ]
     
    }
  ])

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [${var.region}]"
  }
}

output "aws_ecs_task_definition_output" {
  value = aws_ecs_task_definition.task
}