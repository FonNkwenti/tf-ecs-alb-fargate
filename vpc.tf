resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name    = "tf-ecs-alb-fargate"
    Env     = var.tag_environment
    Project = var.tag_project
  }

}


resource "aws_subnet" "pub_sn_az1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-sn-az1"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name    = "tf-ecs-alb-fargate"
    Env     = var.tag_environment
    Project = var.tag_project
  }
}

resource "aws_route_table" "pub_rt_az1" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name    = "pub-rt-az1"
    Env     = var.tag_environment
    Project = var.tag_project
  }
}


resource "aws_route_table_association" "pub_rta1_az1" {
  subnet_id      = aws_subnet.pub_sn_az1.id
  route_table_id = aws_route_table.pub_rt_az1.id
}


# AZ2

resource "aws_subnet" "pub_sn_az2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-sn-az2"
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_route_table" "pub_rt_az2" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name    = "pub-rt-az2"
    Env     = var.tag_environment
    Project = var.tag_project
  }
}


resource "aws_route_table_association" "pub_rta1_az2" {
  subnet_id      = aws_subnet.pub_sn_az2.id
  route_table_id = aws_route_table.pub_rt_az2.id
}





