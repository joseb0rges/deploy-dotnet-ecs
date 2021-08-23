provider "aws" {
  region = var.region
}

# - Create Subnet
resource "aws_subnet" "sub-priv1-DB-dev" {
  vpc_id            = var.rds_vpc_db_id
  cidr_block        = "172.31.30.0/24"
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "sub-priv2-DB-dev" {
  vpc_id            = var.rds_vpc_db_id
  cidr_block        = "172.31.20.0/24"
  availability_zone = "${var.region}b"
}

# - Create Group Subnets
resource "aws_db_subnet_group" "subgp-db-dev" {
  name       = "sub-gp-db-dev"
  subnet_ids = [aws_subnet.sub-priv1-DB-dev.id, aws_subnet.sub-priv2-DB-dev.id]

  tags = {
    Name = "Group Subnet DB"
  }

}

# - Create Instance DB
resource "aws_db_instance" "DB-dev01" {
  allocated_storage     = 20
  max_allocated_storage = 256
  engine                = "postgres"
  engine_version        = "12.6"
  identifier            = "db-teste"
  instance_class        = "db.m3.medium"
  multi_az              = false
  name                  = var.dbname
  password              = var.dbpass
  port                  = 5432
  publicly_accessible   = true
  storage_encrypted     = false
  storage_type          = "gp2"
  username              = var.usernamedb
  db_subnet_group_name  = aws_db_subnet_group.subgp-db-dev.name

  vpc_security_group_ids  = ["${aws_security_group.sg_db_dev.id}"]
  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

}

# - Create Security Group
resource "aws_security_group" "sg_db_dev" {
  name        = "sg_db_dev"
  description = "Security Group Database Desenv"
  vpc_id      = var.rds_vpc_db_id

  # Only postgres in
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}