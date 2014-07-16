require 'cinch'

class Fuck
  include Cinch::Plugin

  match /^!fuck ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "Fuck you, #{msg.user.nick}"
    else
      msg.reply "Fuck you, #{query}"
    end
  end
end
