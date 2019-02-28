output "[remote]" {
  value = "${aws_instance.jenkins-master.public_ip}"
}

# output "ssh-jenkins" {
#   value =  "ssh -i 'jenkins-key.pem' ec2-user@${aws_instance.jenkins-master.public_dns}"
# }

# output "invoke-url" {
#     value = "https://${aws_api_gateway_deployment.ddtdeployment.rest_api_id}.execute-api.${data.aws_region.current.name}.amazonaws.com/${aws_api_gateway_deployment.ddtdeployment.stage_name}/${aws_lambda_function.data_source_ddb.function_name}"
# }