require 'cinch'

class AutoOp
  include Cinch::Plugin
  listen_to :join
  match /!autoop (on|off)$/i

  def listen(m)
    unless m.user.nick == bot.nick
      m.channel.op(m.user) if @autoop
    end
  end

  def execute(m, option)
    @autoop = (option == 'on')

    m.reply "AutoOp is now #{@autoop ? 'enabled' : 'disabled'}"
  end
end

