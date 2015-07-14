require 'giphy'
require 'cinch'

class GiphyPlugin
  include Cinch::Plugin

  match(/!gif($|\s(.*))/i)

  def execute(msg, query)
    msg.reply get_gif(query)
  end

  def get_gif(tag='')
    gif = Giphy.random(tag)

    begin
      return gif.image_url.to_s
    rescue TypeError
      return "No gif found, here's a random one: #{random_gif}"
    end
  end

  def random_gif
    Giphy.random.image_url.to_s
  end
end
