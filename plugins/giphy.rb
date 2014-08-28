require 'giphy'
require 'cinch'

class GiphyPlugin
  include Cinch::Plugin

  match /^!gif ?(.*)/i

  def execute(msg, query)
    msg.reply get_gif(query)
  end

  def get_gif(tag='')
    gif = Giphy.random(tag)

    begin
      return gif_url = gif.image_url.to_s
    rescue TypeError
    end
  end
end
