require 'cinch'

class ManPage
  include Cinch::Plugin

  PLUGINS = ['fuck', 'yo', 'karma', 'up', 'imdb', 'gimme']

  match /^!man ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "I can currently do:"
      msg.reply "!yo (name), !karma (username), !fuck (name), !imdb <film>, !gimme <url> ..."
      msg.reply "I also grab titles from links :)"
    else
      respond_appropriately(msg, query)
    end
  end

  def respond_appropriately(msg, query)
    if PLUGINS.include? query
      help_fuck(msg) if query.eql? 'fuck'
      help_yo(msg) if query.eql? 'yo'
      help_karma(msg) if query.eql? 'karma'
      help_imdb(msg) if query.eql? 'imdb'
      help_gimme(msg) if query.eql? 'gimme'
      msg.reply "Man up, you whiney, little bitch!" if query.eql? 'up'
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

  def help_imdb(msg)
    msg.reply "Usage: !imdb <film>"
    msg.reply "Returns information about the film. Only films atm"
  end

  def help_gimme(msg)
    msg.reply "Usage: !gimme <url> ..."
    msg.reply "Downloads file from url then DCC's it to the user who requested it"
  end
end
