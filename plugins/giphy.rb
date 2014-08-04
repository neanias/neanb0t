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
      gif_url = gif.image_url.to_s
    rescue TypeError
      debug "No gif found for '#{tag}'"
    end
  end
end
