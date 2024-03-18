provider "aws" {
  region     = "us-east-1"
}

provider "random" {
  
}


resource "random_pet" "pet" {
  length = 1
}

resource "aws_s3_bucket" "S3_bucket_EMR" {
  bucket = "emr-athena-bucket-akash-${random_pet.pet.id}"

  force_destroy = true
  tags = {
    Name        = "EMR-Athena-bucket-akashp"
  }
}

resource "aws_s3_object" "fill_bucket" {
  for_each = fileset("${path.module}/files", "**")

  bucket = aws_s3_bucket.S3_bucket_EMR.id
  key    = each.value // Ensure to include the trailing slash
  source = "${path.module}/files/${each.value}"
}