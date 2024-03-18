resource "aws_emr_cluster" "cluster" {
  name          = "emr-test-${random_pet.pet.id}"
  release_label = "emr-7.0.0"
  applications  = ["Spark"]



  termination_protection            = false
  keep_job_flow_alive_when_no_steps = true

  ec2_attributes {
    key_name = "project-pro"
    instance_profile = aws_iam_instance_profile.ec2-instance-profile.arn
  }
  master_instance_group {
    instance_type = "m5.xlarge"

    
  }

  core_instance_group {
    instance_type  = "m5.xlarge"
    instance_count = 2

    
  }

  tags = {
    "for-use-with-amazon-emr-managed-policies" = "true"
  }

  # service_role = aws_iam_role.emr-service-role.arn
  service_role = "arn:aws:iam::171611345452:role/EMR_DefaultRole"
}

