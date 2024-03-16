data "aws_ssm_parameter" "my_amzn_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_launch_template" "lt" {
  name_prefix            = "${terraform.workspace}-example-lt-"
  image_id               = data.aws_ssm_parameter.my_amzn_linux_ami.insecure_value
  instance_type          = local.instance_type
  user_data              = base64encode(templatefile("${path.module}/data/user-data.sh", {}))
  vpc_security_group_ids = [aws_security_group.asg_sg.id]
}

resource "aws_autoscaling_group" "asg" {
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  min_size            = local.min_size
  max_size            = local.max_size
  desired_capacity    = local.desired_capacity
  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [aws_lb_target_group.tg.arn]
}