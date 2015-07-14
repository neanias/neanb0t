require 'cinch'

class Woodo
  include Cinch::Plugin

  match /^!woodo/i

  def execute(msg)
    msg.reply "It's a weird tree."
  end
end
