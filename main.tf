provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  identifier           = "tf-example-db-instance"
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  name                 = "postgres"
  username             = "postgres"
  password             = "postgres"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine_version       = "15.3"
  publicly_accessible  = false

  tags = {
    Name = "TF-Postgres-Instance"
  }
}
