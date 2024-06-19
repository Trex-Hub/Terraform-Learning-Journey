# Creating EC2 Instance
resource "aws_instance" "First-TF-Instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "First-TF-Instance"
  }
  # This will run the script.sh file on the EC2 instance
  user_data = file("${path.module}/script.sh")

  connection {
    # This will connect to the EC2 instance using SSH
    # This will use the private key to connect to the EC2 instance
    # This will use the ec2-user as the user
    # This will use the public IP of the EC2 instance
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "Readme.MD" # This file should be in the same directory as the instance.tf file
    destination = "/tmp/Readme.MD" # This is the destination path on the EC2 instance
  }
  provisioner "file" {
    content     = "This is test content" # This is the content that will be written to the file
    destination = "/tmp/Content.MD"
  }
  provisioner "file" {
    source      = "test-folder" # This is the folder that will be copied to the EC2 instance
    destination = "/tmp/test-folder/"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip_address.txt " # This will write the public IP of the EC2 instance to the file
  }

  provisioner "local-exec" {
    interpreter = [
      "/usr/bin/python3", "-c"
    ]
    command = "print('Hello World')" # This will run the python code on the local machine
  }

  provisioner "local-exec" {
    # This will run only once when the resource is created
    # This will create a file with the environment variables
    command = "env > env.txt"
    environment = {
      host = "localhost"
    }
    
  }

  provisioner "local-exec" {
    when    = destroy # This will only run when the resource is destroyed
    command = "echo 'Destroying...'"
  }

  provisioner "local-exec" {
    # This will run only once when the resource is created
    command = "echo 'Creating Resources...'"
  }
  
}


