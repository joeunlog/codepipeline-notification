project = "test-project"
env = "dev"
region = "ap-northeast-2"

slackWorkspaceId = "TXXXXXXXXX" #Slack workspace ID
slackChannelId = "CXXXXXXXX" #Slack channel ID

notification_rule = {
  First = {
    codepipeline_name = "pipeline1"
    event_type_ids = [
      "codepipeline-pipeline-pipeline-execution-failed",
      "codepipeline-pipeline-pipeline-execution-started",
      "codepipeline-pipeline-pipeline-execution-succeeded"
    ]
  },
  Second = {
    codepipeline_name = "pipeline2"
    event_type_ids = [
      "codepipeline-pipeline-pipeline-execution-failed",
      "codepipeline-pipeline-pipeline-execution-started",
      "codepipeline-pipeline-pipeline-execution-succeeded"
    ]
  }
}