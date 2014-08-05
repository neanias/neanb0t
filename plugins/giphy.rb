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
      return "No gif found for '#{tag}'. Here's a random gif instead: #{random_gif}"
    end
  end

  def random_gif
    gif = Giphy.random

    gif_url = gif.image_url.to_s
  end
end
