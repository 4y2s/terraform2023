resource "aws_lightsail_instance" "example_instance" {
  name              = "example-instance"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"

  instance_snapshot_name = "example-snapshot"
  key_pair_name          = "example-key-pair"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example_instance.public_ip_address
}


