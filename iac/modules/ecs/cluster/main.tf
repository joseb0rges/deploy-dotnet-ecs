resource "aws_kms_key" "key" {
  description             = "${var.name}_kms_key"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "cwatch" {
  name = "${var.name}_cwatch"
}

resource "aws_ecs_cluster" "item" {
  name = "${var.name}_dotnet"

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.key.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.cwatch.name
      }
    }
  }
}

variable "name" {
  type        = string
  default     = ""
  description = "description"
}

output "aws_ecs_cluster_output" {
  value = aws_ecs_cluster.item
}
