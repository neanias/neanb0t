require 'cinch'

require_relative 'config'

Dir['plugins/**'].each do |pl|
    require_relative pl
end

Giphy::Configuration.configure do |config|
  config.version = BotConfig::GIPHY_API_VERSION
  config.api_key = BotConfig::GIPHY_API_KEY
end

bot = Cinch::Bot.new do
  configure do |c|
    c.user = BotConfig::BOT_USERNAME
    c.nick = BotConfig::BOT_NICK
    c.server = BotConfig::SERVER_URL
    c.port = BotConfig::SERVER_PORT
    c.password = BotConfig::SERVER_PASSWORD

    c.channels = BotConfig::NETWORK_CHANNELS

    c.plugins.prefix = BotConfig::PLUGIN_PREFIX
    c.plugins.plugins = [YoYo, Fuck, Gyf, Karma, Title, Butts, Sudo,
                         ManPage, IMDb, FileDownloader, GiphyPlugin, Woodo]
  end
end

bot.start
