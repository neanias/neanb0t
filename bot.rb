require 'cinch'

require_relative 'plugins/yo'

bot = Cinch::Bot.new do
  configure do |c|
    c.user = 'neanb0t'
    c.server = '87.117.253.48'
    c.port = '31333'
    c.password = 'Nemo me impune lacessit'
    c.channels = ['#postevolution w0rdsn0tw4r']

    c.plugins.prefix = ''
    c.plugins.plugins = [Yo]
  end
end

bot.start
