resource "aws_emr_cluster" "cluster" {
  name          = "emr-test-${random_pet.pet.id}"
  release_label = "emr-7.0.0"
  applications  = ["Spark"]

  termination_protection            = false
  keep_job_flow_alive_when_no_steps = true

  ec2_attributes {
    subnet_id                         = aws_subnet.VPC-subnet.id
    key_name                          = "project-pro"
    emr_managed_master_security_group = aws_security_group.allow_access.id
    emr_managed_slave_security_group  = aws_security_group.allow_access.id
    # instance_profile                  = aws_iam_instance_profile.ec2-instance-profile.arn
    instance_profile = "arn:aws:iam::992382386350:instance-profile/EMR_EC2_DefaultRole"
  }
  master_instance_group {
    instance_type = "m4.xlarge"
  }

  core_instance_group {
    instance_type  = "m4.xlarge"
    instance_count = 2

  }

  step {
    name              = "Upload Script"
    action_on_failure = "CONTINUE"
    hadoop_jar_step {
      jar        = "command-runner.jar"
      args       = ["aws", "s3", "cp", "s3://spark-jobs-bucket-akashp7/main.py", "/home/hadoop/"]
    }
  }

  step {
    name              = "Upload Script"
    action_on_failure = "CONTINUE"
    hadoop_jar_step {
      jar        = "command-runner.jar"
      args       = ["aws", "s3", "cp", "s3://spark-jobs-bucket-akashp7/aggregation.py", "/home/hadoop/"]
    }
  }

  step {
    name              = "Run Spark Submit"
    action_on_failure = "CONTINUE"
    hadoop_jar_step {
      jar  = "command-runner.jar"
      args = ["spark-submit", "/home/hadoop/main.py"]
    }
  }

  step {
    name              = "Run Spark Submit"
    action_on_failure = "CONTINUE"
    hadoop_jar_step {
      jar  = "command-runner.jar"
      args = ["spark-submit", "/home/hadoop/aggregation.py"]
    }
  }

  # depends_on = [null_resource.send_files]
  tags = {
    "for-use-with-amazon-emr-managed-policies" = "true"
  }

  # service_role = aws_iam_role.emr-service-role.arn

  service_role = "arn:aws:iam::992382386350:role/EMR_DefaultRole"
}

