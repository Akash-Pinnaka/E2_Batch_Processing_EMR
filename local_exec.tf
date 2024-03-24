# resource "null_resource" "run_athena_query" {
#   # This resource does nothing on its own, it's just used to trigger local-exec provisioner
  

#   provisioner "local-exec" {
#     command = <<EOF
#       aws athena start-query-execution --query-string "SELECT * FROM randomdb.randomtable LIMIT 10;" --result-configuration "OutputLocation=s3://your-athena-query-results-bucket-akashp/query-results/"
#     EOF
#   }

#   depends_on = [aws_glue_catalog_table.catalog_table]
# }



# resource "null_resource" "send_files" {
#   provisioner "local-exec" {
#     command = "scp -i project-pro.pem main.py aggregation.py hadoop@${aws_emr_cluster.cluster.master_public_dns}:/home/hadoop"
#     #ssh -i ~/project-pro.pem hadoop@ec2-100-25-198-158.compute-1.amazonaws.com
#   }
#   triggers = {
#     # Add any dependencies here, for example, the null_resource.rdp_execution.id
#     always_run = "${timestamp()}"
#   }

# }

# resource "null_resource" "exec_files" {
#   provisioner "remote-exec" {
#     inline = [
#       "spark-submit main.py",
#       "spark-submit aggregation.py"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "hadoop"
#       private_key = file("${path.module}/project-pro.pem")
#       host        = "${aws_emr_cluster.cluster.master_public_dns}"
#     }
#   }
#   depends_on = [ null_resource.send_files ]
# }