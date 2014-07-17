require 'cinch'

require_relative 'plugins/yo'
require_relative 'plugins/fuck'
require_relative 'plugins/gyf'
require_relative 'plugins/karma'
require_relative 'plugins/title'
require_relative 'plugins/man_page'
require_relative 'plugins/imdb'

bot = Cinch::Bot.new do
  configure do |c|
    c.user = 'neanb0t'
    c.server = '87.117.253.48'
    c.port = '31333'
    c.password = 'Nemo me impune lacessit'
    c.channels = ['#postevolution w0rdsn0tw4r']

    c.plugins.prefix = ''
    c.plugins.plugins = [Yo, Fuck, Gyf, Karma, Title, ManPage, IMDb]
  end
end

bot.start
