require 'cinch'
require 'httparty'

class Karma
  include Cinch::Plugin

  $base_uri = 'http://api.reddit.com'

  match(/^!karma ?(.*)/i)

  def execute(msg, query)
    if query.empty?
      reddit = HTTParty.get("#{$base_uri}/user/#{msg.user.nick}/about.json",
                            headers: {'User-Agent' => 'neanb0t by neanias'})
      if reddit.success?
        total_karma = reddit['data']['comment_karma'] + reddit['data']['link_karma']

        msg.reply "Total karma for #{msg.user.nick}:    #{total_karma}"
        msg.reply "Comment karma for #{msg.user.nick}:  #{reddit['data']['comment_karma']}"
        msg.reply "Link karma for #{msg.user.nick}:     #{reddit['data']['link_karma']}"
      else
        msg.reply "Reddit couldn't find #{msg.user.nick}. They might not exist."
      end
    else
      reddit = HTTParty.get("#{$base_uri}/user/#{query}/about.json",
                            headers: {'User-Agent' => 'neanb0t by neanias'})
      if reddit.success?
        total_karma = reddit['data']['comment_karma'] + reddit['data']['link_karma']

        msg.reply "Total karma for #{query}:    #{total_karma}"
        msg.reply "Comment karma for #{query}:  #{reddit['data']['comment_karma']}"
        msg.reply "Link karma for #{query}:     #{reddit['data']['link_karma']}"
      else
        msg.reply "Reddit couldn't find #{query}. They might not exist."
      end
    end
  end
end

