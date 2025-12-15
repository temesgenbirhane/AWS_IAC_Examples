resource "aws_s3_bucket" "my-terraform-bucket876876" {

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}