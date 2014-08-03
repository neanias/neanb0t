require 'giphy'
require 'cinch'

class Giphy
  include Cinch::Plugin

  match /^!gif ?(.*)/i

  def execute(msg, query)
    msg.user.reply get_gif(query)
  end

  def get_gif(tag='')
    gif = Giphy.random(tag)
    gif_url = gif.image_url.to_s
  end
end
