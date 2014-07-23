require 'cinch'

class AutoOp
  include Cinch::Plugin
  listen_to :join
  match /!autoop (on|off)$/i

  def listen(m)
    unless m.user.nick == bot.nick
      m.channel.op(m.user) if @autovoice
    end
  end

  def execute(m, option)
    @autovoice = (option == 'on')

    m.reply "AutoOp is now #{@autovoice ? 'enabled' : 'disabled'}"
  end
end

