output "bucket_name" {
  value = "${aws_s3_bucket.S3_bucket_data.id}"
}

output "bucket_domain_name" {
  value = "${aws_s3_bucket.S3_bucket_data.bucket_domain_name}"
}

output "master_dns" {
  value = "${aws_emr_cluster.cluster.master_public_dns}"
}

output "glue_table" {
  value = "${aws_glue_catalog_table.catalog_table.id}"
}