# codepipeline-notification
---
AWS Codepipeline의 실행 결과를 slack notification 하기 위해 AWS Chatbot과 AWS SNS를 이용합니다.
AWS Chatbot은 API를 지원하지 않기 때문에, Cloudformation을 활용하여 설정합니다.

## prerequisite
- Terraform backend로 S3를 사용하기 때문에, tfstate가 저장될 S3를 구성합니다.
- Notification을 설정할 Codepipeline을 구성합니다.
- AWS console에서 Chatbot 서비스에 새로운 클라이언트 구성을 통해 원하는 Slack workspace와 연동합니다.
- Notification을 받고자 하는 Slack Channel에서 `/invite @aws`를 입력하여 aws 앱을 추가합니다.

## Usage
tfstate가 저장될 S3 정보를 `env/dev_backend.hcl`에 `bucket` 이름과 `region`으로 정의합니다.
```
aws configure
terraform init -backend-config=env/dev_backend.hcl
terraform plan -var-file=env/dev.tfvars
terraform apply -var-file=env/dev.tfvars
```