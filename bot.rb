require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.user = 'neanb0t'
    c.server = '87.117.253.48'
    c.port = '31333'
    c.channels = ['#postevolution w0rdsn0tw4r']
  end
end
