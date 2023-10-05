# codepipeline-notification
---
AWS Codepipeline의 실행 결과를 slack notification 하기 위해 AWS Chatbot과 AWS SNS를 이용합니다.
AWS Chatbot은 API를 지원하지 않기 때문에, Cloudformation을 활용하여 설정합니다.

## prerequisite
- AWS console에서 Chatbot 서비스에 새로운 클라이언트 구성을 통해 원하는 Slack workspace와 연동합니다.
- Notification을 받고자 하는 Slack Channel에서 `/invite @aws`를 입력하여 aws 앱을 추가합니다.
