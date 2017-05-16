require 'redis'
module Mention
    
  def mentioned_recently?
    now = Time.now.utc 
    mention = @redis.get(@name)
    
    return false unless mention
    mention = Time.parse(mention)
    mention ||= now 
    
    last_seen = (now - mention)
    Lita.logger.info "#{@name} last mentioned at #{mention}, now #{now}, diff #{last_seen}"
    return last_seen < Lita.config.handlers.jira_issues.timeout
  end
  
  def mentioned!
    @redis.set(@name, Time.now.utc)
  end
  
end
