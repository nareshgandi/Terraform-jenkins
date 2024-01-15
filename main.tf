provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_db_instance" "my_postgres_instance" {
  allocated_storage      = 10       # Allocate 10 GB of storage
  engine                 = "postgres"
  engine_version         = "15.3"    # Specify the desired PostgreSQL version
  instance_class         = "db.t2.micro"
  name                   = "my_postgres_db"
  username               = "postgres"
  password               = "postgres"  # Store passwords securely, not in plain text
  db_subnet_group_name   = "rdsa-postgresql-db-subnet-group"  # Specify your DB subnet group
  vpc_security_group_ids = ["sg-0c74eb2fad61f0001"]      # Specify your VPC security group

}
