require 'cinch'

require_relative 'config'

require_relative 'plugins/yo'
require_relative 'plugins/fuck'
require_relative 'plugins/gyf'
require_relative 'plugins/karma'
require_relative 'plugins/title'
require_relative 'plugins/man_page'
require_relative 'plugins/imdb'
require_relative 'plugins/downloader'
require_relative 'plugins/giphy'

efnet = Cinch::Bot.new do
  configure do |c|
    c.user            = 'neanb0t/efnet'
    c.nick            = 'neanb0t'
    c.server          = '87.117.253.48'
    c.port            = '31333'
    c.password        = 'Nemo me impune lacessit'
    c.channels        = ['#postevolution w0rdsn0tw4r']

    c.plugins.prefix  = ''
    c.plugins.plugins = [Yo, Fuck, Gyf, Karma, Title,
                         ManPage, IMDb, FileDownloader, GiphyPlugin]
  end
end

imaginarynet = Cinch::Bot.new do
  configure do |c|
    c.user = 'neanb0t/imaginarynet'
    c.nick = 'neanb0t'
    c.server = '87.117.253.48'
    c.port = '31334'
    c.password = 'Nemo me impune lacessit'
    c.channels = ['#inf1']

    c.plugins.prefix = ''
    c.plugins.plugins = [Yo, Fuck, Gyf, Karma, Title,
                         ManPage, IMDb, FileDownloader, GiphyPlugin]
  end
end

efnet.start
imaginarynet.start
