require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/jira_issues"
require "mention"
require "jira_issue"

Lita::Handlers::JiraIssues.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
