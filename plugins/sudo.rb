require 'cinch'

class Sudo
  include Cinch::Plugin

  match /^!sudo ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "I'm rooting for you, #{msg.user.nick}!"
    elsif query.match(/woodo/i)
      msg.reply '     _              __'
      msg.reply '    / `\  (~._    ./  )'
      msg.reply '    \__/ __`-_\__/ ./'
      msg.reply '   _ \ \/  \   \ |_   __'
      msg.reply ' (   )  \__/ -^    \ /  \\'
      msg.reply '  \_/ "  \  | o  o  |.. /  __'
      msg.reply "       \\. --' ====  /  || /  \\ "
      msg.reply '         \   .  .  |---__.\__/'
      msg.reply '         /  :     /   |   |'
      msg.reply '         /   :   /     \_/'
      msg.reply '      --/ ::    ('
      msg.reply '     (  |     (  (____'
      msg.reply '   .--  .. ----**.____)'
      msg.reply '   \___/          '
    elsif query.match /ku/i
      msg.reply 'Try here: http://www.websudoku.com'
    else
      check_user(msg)
    end
  end

  def check_user(msg)
    if msg.user.nick == 'neanias'
      msg.reply "'Sup"
    else
      msg.reply "#{msg.user.nick} is not in the sudoers file. This incident will be reported (to Father Christmas)."
    end
  end
end
