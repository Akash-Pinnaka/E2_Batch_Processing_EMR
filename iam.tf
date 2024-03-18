##IAM role creation for EMR
# resource "aws_iam_role" "emr-service-role" {
#   name = "EMR_DefaultRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           Service = "elasticmapreduce.amazonaws.com"
#         },
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
#   tags = {
#     for-use-with-amazon-emr-managed-policies = true
#   }
# }

# resource "aws_iam_role_policy_attachment" "emr-serivece-role-attachment" {
#   role       = aws_iam_role.emr-service-role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEMRServicePolicy_v2"
# }




#IAM role creation for ec2 Instance profile

resource "aws_iam_role" "ec2-instance-role" {
  name = "EMR_EC2_test_Role"
  # name = "EMR_EC2_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "elasticmapreduce.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "EMR-policy" {
  name = "EMR-Policy"
  role = aws_iam_role.ec2-instance-role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Resource" : "*",
        "Action" : [
          "cloudwatch:*",
          "dynamodb:*",
          "ec2:Describe*",
          "elasticmapreduce:Describe*",
          "elasticmapreduce:ListBootstrapActions",
          "elasticmapreduce:ListClusters",
          "elasticmapreduce:ListInstanceGroups",
          "elasticmapreduce:ListInstances",
          "elasticmapreduce:ListSteps",
          "kinesis:CreateStream",
          "kinesis:DeleteStream",
          "kinesis:DescribeStream",
          "kinesis:GetRecords",
          "kinesis:GetShardIterator",
          "kinesis:MergeShards",
          "kinesis:PutRecord",
          "kinesis:SplitShard",
          "rds:Describe*",
          "s3:*",
          "sdb:*",
          "sns:*",
          "sqs:*",
          "glue:CreateDatabase",
          "glue:UpdateDatabase",
          "glue:DeleteDatabase",
          "glue:GetDatabase",
          "glue:GetDatabases",
          "glue:CreateTable",
          "glue:UpdateTable",
          "glue:DeleteTable",
          "glue:GetTable",
          "glue:GetTables",
          "glue:GetTableVersions",
          "glue:CreatePartition",
          "glue:BatchCreatePartition",
          "glue:UpdatePartition",
          "glue:DeletePartition",
          "glue:BatchDeletePartition",
          "glue:GetPartition",
          "glue:GetPartitions",
          "glue:BatchGetPartition",
          "glue:CreateUserDefinedFunction",
          "glue:UpdateUserDefinedFunction",
          "glue:DeleteUserDefinedFunction",
          "glue:GetUserDefinedFunction",
          "glue:GetUserDefinedFunctions"
        ]
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2-instance-profile" {
  name = "EC2InstanceProfile"
  # role = aws_iam_role.ec2-instance-role.name
  role = aws_iam_role.ec2-instance-role.name
}
