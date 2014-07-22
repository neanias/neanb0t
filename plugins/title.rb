require 'uri'
require 'open-uri'
require 'cinch'
require 'nokogiri'

class Title
  include Cinch::Plugin

  match /(.*#{URI.regexp}.*)/

  def execute(msg)
    unless msg.user.nick.match /^.*b[o0]t$/
      string = msg.params.last
      urls = URI.extract(string)

      unless urls.empty?
        urls.each do |url|
          get_title(msg, url)
        end
      end
    end
  end

  def get_title(msg, url)
    html = Nokogiri::HTML(open(url))
    title = html.xpath('//title').inner_text

    unless title.empty?
      msg.reply "#{title} - #{url}"
    end
  end
end
