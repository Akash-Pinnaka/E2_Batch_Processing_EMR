resource "aws_security_group" "allow_access" {
  name        = "allow_access"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.VPC.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["24.170.200.57/32"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.VPC.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_subnet.VPC-subnet]

  lifecycle {
    ignore_changes = [
      ingress,
      egress,
    ]
  }

  tags = {
    name = "emr_security_gp"
  }
}