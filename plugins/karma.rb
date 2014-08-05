class Karma
  include Cinch::Plugin
  include HTTParty

  base_uri 'http://api.reddit.com'

  match /^!karma ?(.*)/i

  def execute(msg, query)
    if query.empty?
      reddit = self.class.get("/user/#{msg.user.nick}/about.json")
      if reddit.success?
        total_karma = reddit['data']['comment_karma'] + reddit['data']['link_karma']

        msg.reply "Total karma for #{msg.user.nick}:    #{total_karma}"
        msg.reply "Comment karma for #{msg.user.nick}:  #{reddit['data']['comment_karma']}"
        msg.reply "Link karma for #{msg.user.nick}:     #{reddit['data']['link_karma']}"
      else
        msg.reply "You don't have an account on Reddit. I wouldn't reccomend opening one."
        msg.reply "It's dangerously addictive."
      end
    else
      reddit = self.class.get("/user/#{query}/about.json")
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

