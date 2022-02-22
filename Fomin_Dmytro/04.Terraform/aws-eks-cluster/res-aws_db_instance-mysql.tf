# Resource: aws_db_instance
# Provides an RDS instance resource. A DB instance is an isolated database environment in 
# the cloud. A DB instance can contain multiple user-created databases.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

resource "aws_db_instance" "mysql" {
  # Engine options
  engine         = "mysql"
  engine_version = "5.7"

  # Settings
  db_name    = "joomla-db"
  identifier = "joomla-db"

  # Credentials Settings
  username = "foo"
  password = "foobarbaz"

  # DB instance size
  instance_class = "db.t2.micro"

  # Storage
  storage_type          = "gp2"
  allocated_storage     = 1
  max_allocated_storage = 5

  # Encryption
  storage_encrypted = true

  # Availability & durability
  multi_az = true

  # Connectivity
  # db_subnet_group_name        = aws_db_subnet_group.sg.id
  # vpc_security_group_ids      = [aws_security_group.sg.id]
  # parameter_group_name        = aws_db_parameter_group.education.name
  # publicly_accessible         = false
  # port                        = var.rds_port

  # Additional configuration
  parameter_group_name = "default.mysql5.7"

  # Maintenance
  # auto_minor_version_upgrade  = true
  # maintenance_window          = "Sat:00:00-Sat:02:00"

  # # Backup
  # backup_retention_period     = 14
  # backup_window               = "03:00-04:00"
  # final_snapshot_identifier   = "mysql-final-snapshot-${random_string.db_suffix.result}" 
  # delete_automated_backups    = true
  # Set to true to disable taking a final backup when you destroy the database
  # skip_final_snapshot         = false

  # # Deletion protection
  # deletion_protection         = false

  # tags = {
  #     Name = ""
  # }
}