# lita-jira-issues

Watches a channel for JIRA issue mentions and displays a link and helpful information

## Installation

Add lita-jira-issues to your Lita instance's Gemfile:

``` ruby
gem "lita-jira-issues"
```

## Configuration

Add the following to your lita_config.rb and customize:
  # lita-jira-issues
  config.handlers.jira_issues.username = "<jira user name>"
  config.handlers.jira_issues.password = "<password>"
  config.handlers.jira_issues.site = "http://code.example.com/jira/"
  config.handlers.jira_issues.context_path = ''
  config.handlers.jira_issues.auth_type = 'basic'
  config.handlers.jira_issues.base_url = "http://code.example.com/jira/browse/"

## Usage

TODO: Describe the plugin's features and how to use them.


## Changelog
  0.0.1 Initial implementation, only links are output for now.
