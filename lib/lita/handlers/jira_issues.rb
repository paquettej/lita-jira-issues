module Lita 
  module Handlers 
    class JiraIssues < Handler 

      config :base_url, type: String, required: true 
      config :timeout, type: Float, default: 600.0, required: false

      config :username, type: String, required: true 
      config :password, type: String, required: true 
      config :site, type: String, required: true 
      config :context_path, type: String, required: false 
      config :auth_type, type: String, required: true 


      route %r{([A-Z]{2,}-\d+)}i, :build_issue_link 

      # build a link to ratus1 here 
      def build_issue_link(response) 
          Lita.logger.warn "triggered "
        # don't respond to own messages -- why does this happen?
        if response.user.name == Lita.config.robot.name
          Lita.logger.warn "received message from myself, ignoring..."
          return
        end
                  
        visible_issues = load_issues(response.matches.flatten)
        Lita.logger.info("visible_issues count: #{visible_issues.length}")
        
        if visible_issues.any?
          case robot.config.robot.adapter 
          when :slack 
            target = response.message.source.room_object || response.message.source.user 
            urls = format_urls_for_slack(visible_issues)
            robot.chat_service.send_attachment(target, build_attachment(urls.join(', ')))
          else 
            response.reply(render_template('issue', issue: visible_issues.first, url: visible_issues.first.url)) 
          end 
          visible_issues.map(&:mentioned!)
        end
      end 

      def format_urls_for_slack(issues)
        links = []
        issues.each do |issue|
          links << format_url(issue)
        end
        links
      end
      
      def format_url(issue) 
        "<#{issue.url}|#{issue.name}>" 
      end       

      def load_issues(issue_list)
        links = []
        issue_list.each do |issue|
          jira_issue = JiraIssue.new(issue, redis)
          Lita.logger.info "ISSUE #{jira_issue.name} mention status #{jira_issue.mentioned_recently?}"
          links << jira_issue unless jira_issue.mentioned_recently?
        end
        links
      end
      
      # build the attachment object for slack
      def build_attachment(text) 
        Lita::Adapters::Slack::Attachment.new(text, 
        { 
          :color => 'danger', 
          :title => 'Recently mentioned defects', 
          :thumb_url => 'http://i.imgur.com/Z5HdCsT.png', 
        }) 
      end 
    end 

    Lita.register_handler(JiraIssues) 
  end 
end
