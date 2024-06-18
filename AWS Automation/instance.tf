# Creating EC2 Instance
resource "aws_instance" "First-TF-Instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "First-TF-Instance"
  }
  user_data =file("${path.module}/script.sh")
}
