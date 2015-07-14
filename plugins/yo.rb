require 'cinch'
require 'yo-ruby'

class YoYo
  include Cinch::Plugin

  match /^!yo\s?(.*)/i

  Yo.api_key = BotConfig::YO_API_TOKEN

  def execute(msg, query)
    if query.empty?
      yo_all(msg)
    else
      yo_user(msg, query)
    end
  end

  def yo_all(msg)
    Yo.all!
  rescue YoRateLimitExceeded
    msg.reply "Yo'd again too soon. Please wait 1 minute between Yo!s"
  end

  def yo_user(msg, person)
    Yo.yo! person
  rescue YoUserNotFound
    msg.reply "#{person.upcase} couldn't be found"
  rescue YoRateLimitExceeded
    msg.reply "Yo'd again too soon. Please wait 1 minute between Yo!s"
  end
end
