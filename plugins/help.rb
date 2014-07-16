require 'cinch'

class Help
  include Cinch::Plugin

  match /^!help/

  def execute(msg)
    m.reply "I can currently do:"
    m.reply "!yo (name), !karma (username), !fuck (name)"
    m.reply "I also grab titles from links :)"
  end
end
