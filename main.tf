provider "aws" {
  region = "ap-northeast-1"
}


resource "aws_cloudformation_stack" "example_stack" {
  name          = "ExampleStack"
  template_body = file("template.yaml")
  capabilities  = ["CAPABILITY_NAMED_IAM"]
}
