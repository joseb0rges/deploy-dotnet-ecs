
resource "aws_ecs_service" "item" {
  name            = var.name
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = var.replicas_count

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [${var.region}]"
  }
}

output "aws_ecs_service_output" {
  value = aws_ecs_service.item
}

# Possui dependencia de um Cluster e de uma Task Definition