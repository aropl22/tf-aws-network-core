resource "aws_security_group" "sgroup-remote-access" {
  name        = "sgroup-remote-access"
  description = "Allow remote from office"
  vpc_id      = module.vpc1.vpc_id

  dynamic "ingress" {

    for_each = var.sgroup_remote_rules

    content {

      from_port   = ingress.value.port_from
      to_port     = ingress.value.port_to
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.remote_cidr_block]

    }
  }
  egress {
    # Allow all outgoing traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "remote-access"
  }
}
