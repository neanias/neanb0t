require 'securerandom'
require 'cinch'
require 'httparty'

class Gyf
  include Cinch::Plugin
  include HTTParty

  match %r{^!gyf (https?://)?(i?\.?)?imgur\.com/(.*)\.gif}i

  def execute(msg, query)
    if query.empty?
      msg.reply "You must provide an imgur link ending in .gif, e.g. http://i.imgur.com/pozXCLP.gif"
    else
      upload_path = "http://upload.gfycat.com/transcode/#{SecureRandom.hex(5)}"
      unless gyf_exists? query
        upload_path << "?fetchUrl=#{query}"
        converted = convert_gif(upload_path)
        msg.reply "Gyf link:           #{converted[:link]}"
        msg.reply "Original gif size:  #{converted[:human_gif_size]}MB"
        msg.reply "Gyf size:           #{converted[:human_gyf_size]}MB"
        msg.reply "Compression ratio:  #{converted[:compression_ratio]}"
      else
        msg.reply "That gif previously converted, here is the URL:"
        msg.reply get_gyf_link(query)
      end
    end
  end

  def gyf_exists?(link)
    check = self.class.get("http://gfycat.com/cajax/checkUrl/#{link}")
    return check['urlKnown']
  end

  def get_gyf_link(link)
    gyfed = self.class.get("http://gfycat.com/cajax/checkUrl/#{link}")
    return gyfed['gfyUrl']
  end

  def convert_gif(upload_link)
    pretty_return = {}
    raw_data = self.class.get(upload_link)
    pretty_return[:link] = "http://gfycat.com/#{raw_data['gfyName']}"
    comp_ratio = "#{(raw_data['gifSize'].to_f / raw_data['gfySize']).round(1)}:1"
    pretty_return[:compression_ratio] = comp_ratio
    pretty_return[:human_gif_size] = humanise(raw_data['gifSize'])
    pretty_return[:human_gyf_size] = humanise(raw_data['gfySize'])
  end

  def humanise(size)
    (size.to_f / 1_000_000).round(2)
  end
end
