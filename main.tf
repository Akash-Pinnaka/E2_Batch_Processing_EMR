provider "aws" {
  region = "us-east-1"
}

provider "random" {

}


resource "random_pet" "pet" {
  length = 1
}

#Bucket for input and output files
resource "aws_s3_bucket" "S3_bucket_data" {
  bucket = "emr-athena-bucket-akashp7"

  force_destroy = true
  tags = {
    Name = "emr-athena-bucket-akashp7"
  }
}

resource "aws_s3_object" "fill_data_bucket" {
  for_each = fileset("${path.module}/files", "**")

  bucket = aws_s3_bucket.S3_bucket_data.id
  key    = each.value // Ensure to include the trailing slash
  source = "${path.module}/files/${each.value}"
}

#Bucket for storing scripts
resource "aws_s3_bucket" "S3_bucket_script" {
  bucket = "spark-jobs-bucket-akashp7"

  force_destroy = true
  tags = {
    Name = "spark-jobs-bucket-akashp7"
  }
}

resource "aws_s3_object" "fill_script_bucket" {
  for_each = fileset("${path.module}/code", "**")

  bucket = aws_s3_bucket.S3_bucket_script.id
  key    = each.value // Ensure to include the trailing slash
  source = "${path.module}/code/${each.value}"

  depends_on = [aws_s3_object.fill_data_bucket]
}
