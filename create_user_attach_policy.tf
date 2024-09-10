resource "aws_iam_user" "new_user" {
  name = "new_user"
}

resource "aws_iam_policy" "serverless_policy" {
  name        = "ServerlessPolicy"
  description = "Policy for CloudFormation, CloudWatch Logs, and Serverless access"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cloudformation:CreateStack",
          "cloudformation:UpdateStack",
          "cloudformation:DeleteStack"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "lambda:CreateFunction",
          "lambda:UpdateFunctionCode",
          "lambda:InvokeFunction",
          "lambda:GetFunctionConfiguration",
          "lambda:DeleteFunction"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "apigateway:GET",
          "apigateway:POST",
          "apigateway:DELETE"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "serverlessrepo:CreateCloudFormationTemplate",
          "serverlessrepo:DeployApplication",
          "serverlessrepo:GetApplication"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.new_user.name
  policy_arn = aws_iam_policy.serverless_policy.arn
}

resource "aws_iam_access_key" "new_user_key" {
  user = aws_iam_user.new_user.name
}

output "new_user_access_key" {
  value     = aws_iam_access_key.new_user_key.id
  sensitive = true
}

output "new_user_secret_key" {
  value     = aws_iam_access_key.new_user_key.secret
  sensitive = true
}