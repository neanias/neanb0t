require 'rubygems'
require 'bundler'
Bundler.require(:default)

require 'cinch'

require_relative 'config'

Dir["plugins/**"].each do |plugin|
  require_relative plugin
end

bot = Cinch::Bot.new do
  configure do |c|
    c.user = 'neanb0t'
    c.server = '87.117.253.48'
    c.port = '31333'
    c.password = 'Nemo me impune lacessit'
    c.channels = ['#postevolution w0rdsn0tw4r']

    c.plugins.prefix = ''
    c.plugins.plugins = [Yo, Fuck, Gyf, Karma, Title,
                         ManPage, IMDb, FileDownloader, GiphyPlugin]
  end
end

bot.start
