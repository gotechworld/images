
terraform {

  backend "s3" {
     bucket = "tf-stage-atx-s3"
     key    = "stage/tfstore"
     region = "eu-central-1"
     encrypt = "true"
     dynamodb_table = "aws-stage-dynamodb-table"

}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}

provider "aws" {
      region = var.region
}

# List of available AZ's
data "aws_availability_zones" "azs" {}

# Elastic IP
resource "aws_eip" "nat" {
  count = 1
  vpc = true
}

locals {
    cluster_name = var.cls_name
}


# Security groups

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix		= var.sec_group_name
  vpc_id		= var.vpc_id

ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"

cidr_blocks = [
            "10.0.0.0/16"
        ]
    }

}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}
