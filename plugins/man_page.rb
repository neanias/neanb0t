require 'cinch'

class Help
  include Cinch::Plugin

  match /^!help ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "I can currently do:"
      msg.reply "!yo (name), !karma (username), !fuck (name)"
      msg.reply "I also grab titles from links :)"
    end

    if ['fuck', 'yo', 'karma'].include? query
      help_fuck(msg) if query.eql? 'fuck'
      help_yo(msg) if query.eql? 'yo'
      help_karma(msg) if query.eql? 'karma'
    else
      msg.reply "I don't know how to do that."
    end
  end

  def help_fuck(msg)
    msg.reply "Usage: !fuck (username)"
    msg.reply "For when you are really pissed off at someone"
  end

  def help_karma(msg)
    msg.reply "Usage: !karma (username)"
    msg.reply "Grabs the reddit karma for the specified user. Either you or the username"
  end

  def help_yo(msg)
    msg.reply "Usage: !yo (username)"
    msg.reply "Yo!"
  end
end
