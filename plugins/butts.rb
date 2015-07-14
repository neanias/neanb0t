require 'cinch'

class Butts
  include Cinch::Plugin

  match /^!butts ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "Butts, though, amiright? #{msg.user.nick} knows what I'm talking about!"
    else
      msg.reply "Butts, though, amiright? #{query} knows what I'm talking about!"
    end
  end
end
