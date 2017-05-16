class JiraIssue

  include Mention
  
  def initialize(issue_slug, redis_instance)
    @name = issue_slug
    @redis = redis_instance
  end

  def name
    @name
  end
  
  def synopsis
  end
  
  def filed_against
  end
  
  def priority
  end
  
  def url
    Lita.config.handlers.jira_issues.base_url + CGI::escape(@name) 
  end 

end
