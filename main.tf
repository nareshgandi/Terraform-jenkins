# Create the PostgreSQL RDS instance
resource "aws_db_instance" "postgres" {
  identifier             = "my-postgres-db"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"  # Change this to your desired instance type
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = "postgres"
  password               = "postgres"  # Change this to your desired database password
  parameter_group_name   = "default.postgres15"
  publicly_accessible    = true
  skip_final_snapshot    = true  # Set to false if you want to create a final snapshot on deletion

  # Use the existing VPC, subnet, and subnet group IDs/names
  vpc_security_group_ids = ["sg-0c74eb2fad61f0001"]
  db_subnet_group_name    = "rdsa-postgresql-db-subnet-group"

  # You can set the "availability_zone" attribute if you want to specify a specific AZ for the RDS instance
  # availability_zone = "us-east-1a"
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
