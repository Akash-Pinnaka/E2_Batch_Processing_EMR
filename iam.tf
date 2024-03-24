# #IAM role creation for EMR
# resource "aws_iam_role" "emr-service-role" {
#   name = "EMR_Service_Role_ProjectPro"
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


# resource "aws_iam_role_policy" "emr-serivce-role-policy" {
#   name = "emr-serivce-role-policy"
#   # policy = data.aws_iam_policy_document.emr_service_policy.json
#   policy = jsonencode(
#     {
#       "Version" : "2012-10-17",
#       "Statement" : [
#         {
#           "Effect" : "Allow",
#           "Resource" : "*",
#           "Action" : [
#             "ec2:AuthorizeSecurityGroupEgress",
#             "ec2:AuthorizeSecurityGroupIngress",
#             "ec2:CancelSpotInstanceRequests",
#             "ec2:CreateFleet",
#             "ec2:CreateLaunchTemplate",
#             "ec2:CreateNetworkInterface",
#             "ec2:CreateSecurityGroup",
#             "ec2:CreateTags",
#             "ec2:DeleteLaunchTemplate",
#             "ec2:DeleteNetworkInterface",
#             "ec2:DeleteSecurityGroup",
#             "ec2:DeleteTags",
#             "ec2:DescribeAvailabilityZones",
#             "ec2:DescribeAccountAttributes",
#             "ec2:DescribeDhcpOptions",
#             "ec2:DescribeImages",
#             "ec2:DescribeInstanceStatus",
#             "ec2:DescribeInstances",
#             "ec2:DescribeKeyPairs",
#             "ec2:DescribeLaunchTemplates",
#             "ec2:DescribeNetworkAcls",
#             "ec2:DescribeNetworkInterfaces",
#             "ec2:DescribePrefixLists",
#             "ec2:DescribeRouteTables",
#             "ec2:DescribeSecurityGroups",
#             "ec2:DescribeSpotInstanceRequests",
#             "ec2:DescribeSpotPriceHistory",
#             "ec2:DescribeSubnets",
#             "ec2:DescribeTags",
#             "ec2:DescribeVpcAttribute",
#             "ec2:DescribeVpcEndpoints",
#             "ec2:DescribeVpcEndpointServices",
#             "ec2:DescribeVpcs",
#             "ec2:DetachNetworkInterface",
#             "ec2:ModifyImageAttribute",
#             "ec2:ModifyInstanceAttribute",
#             "ec2:RequestSpotInstances",
#             "ec2:RevokeSecurityGroupEgress",
#             "ec2:RunInstances",
#             "ec2:TerminateInstances",
#             "ec2:DeleteVolume",
#             "ec2:DescribeVolumeStatus",
#             "ec2:DescribeVolumes",
#             "ec2:DetachVolume",
#             "iam:GetRole",
#             "iam:GetRolePolicy",
#             "iam:ListInstanceProfiles",
#             "iam:ListRolePolicies",
#             "iam:PassRole",
#             "s3:CreateBucket",
#             "s3:Get*",
#             "s3:List*",
#             "sdb:BatchPutAttributes",
#             "sdb:Select",
#             "sqs:CreateQueue",
#             "sqs:Delete*",
#             "sqs:GetQueue*",
#             "sqs:PurgeQueue",
#             "sqs:ReceiveMessage",
#             "cloudwatch:PutMetricAlarm",
#             "cloudwatch:DescribeAlarms",
#             "cloudwatch:DeleteAlarms",
#             "application-autoscaling:RegisterScalableTarget",
#             "application-autoscaling:DeregisterScalableTarget",
#             "application-autoscaling:PutScalingPolicy",
#             "application-autoscaling:DeleteScalingPolicy",
#             "application-autoscaling:Describe*"
#           ]
#         },
#         {
#           "Effect" : "Allow",
#           "Action" : "iam:CreateServiceLinkedRole",
#           "Resource" : "arn:aws:iam::*:role/aws-service-role/spot.amazonaws.com/AWSServiceRoleForEC2Spot*",
#           "Condition" : {
#             "StringLike" : {
#               "iam:AWSServiceName" : "spot.amazonaws.com"
#             }
#           }
#         }
#       ]
#   })
#   role = aws_iam_role.emr-service-role.id
# }


# #IAM role creation for ec2 Instance profile

# resource "aws_iam_role" "ec2-instance-role" {
#   name = "EMR_EC2_test_Role"
#   # name = "EMR_EC2_Role"
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
# }

# resource "aws_iam_role_policy" "EMR-policy" {
#   name = "EMR-Policy"
#   role = aws_iam_role.ec2-instance-role.id

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Effect" : "Allow",
#         "Resource" : "*",
#         "Action" : [
#           "cloudwatch:*",
#           "dynamodb:*",
#           "ec2:Describe*",
#           "elasticmapreduce:Describe*",
#           "elasticmapreduce:ListBootstrapActions",
#           "elasticmapreduce:ListClusters",
#           "elasticmapreduce:ListInstanceGroups",
#           "elasticmapreduce:ListInstances",
#           "elasticmapreduce:ListSteps",
#           "kinesis:CreateStream",
#           "kinesis:DeleteStream",
#           "kinesis:DescribeStream",
#           "kinesis:GetRecords",
#           "kinesis:GetShardIterator",
#           "kinesis:MergeShards",
#           "kinesis:PutRecord",
#           "kinesis:SplitShard",
#           "rds:Describe*",
#           "s3:*",
#           "sdb:*",
#           "sns:*",
#           "sqs:*",
#           "glue:CreateDatabase",
#           "glue:UpdateDatabase",
#           "glue:DeleteDatabase",
#           "glue:GetDatabase",
#           "glue:GetDatabases",
#           "glue:CreateTable",
#           "glue:UpdateTable",
#           "glue:DeleteTable",
#           "glue:GetTable",
#           "glue:GetTables",
#           "glue:GetTableVersions",
#           "glue:CreatePartition",
#           "glue:BatchCreatePartition",
#           "glue:UpdatePartition",
#           "glue:DeletePartition",
#           "glue:BatchDeletePartition",
#           "glue:GetPartition",
#           "glue:GetPartitions",
#           "glue:BatchGetPartition",
#           "glue:CreateUserDefinedFunction",
#           "glue:UpdateUserDefinedFunction",
#           "glue:DeleteUserDefinedFunction",
#           "glue:GetUserDefinedFunction",
#           "glue:GetUserDefinedFunctions"
#         ]
#       }
#     ]
#   })
# }

# resource "aws_iam_instance_profile" "ec2-instance-profile" {
#   name = "EC2InstanceProfile"
#   role = aws_iam_role.ec2-instance-role.name
#   # role = "EMR_EC2_DefaultRole"
# }
