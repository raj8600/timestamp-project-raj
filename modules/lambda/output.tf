output "lambda_arn_output" {
    value = aws_lambda_function.timestamp_lambda.invoke_arn
}