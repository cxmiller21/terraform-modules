# Get local ip address
data "http" "my_ip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "main" {
  ami                  = data.aws_ami.al2.id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ssm.name
  # key_name      = ""
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }

  tags = {
    Name        = var.instance_name
  }
}

resource "aws_iam_instance_profile" "ssm" {
  name = "${var.instance_name}-instance-ssm-profile"
  role = aws_iam_role.ssm.name
}

resource "aws_iam_role" "ssm" {
  name               = "${var.instance_name}-instance-ssm-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Allow AWS SSM access to connect to the instance
resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
