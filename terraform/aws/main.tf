data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "wirehole" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.wireholesg.id]
  tags = {
    Name = "wirehole"
  }
}

resource "aws_security_group" "wireholesg" {
  name   = "wireholesg"
}

resource "aws_security_group_rule" "all_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.wireholesg.id
}

resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.wireholesg.id
}