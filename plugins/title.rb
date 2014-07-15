require 'uri'
require 'open-uri'
require 'cinch'
require 'nokogiri'

class Title
  include Cinch::Plugin

  match /.*#{URI.regexp}.*/

  def execute(msg, query)
    string = msg.params.last
    urls = URI.extract(string)

    unless urls.empty?
      urls.each do |url|
        msg.reply "Title of url: #{get_title(url)}"
      end
    end
  end

  def get_title(url)
    html = Nokogiri::HTML(open(url))
    title = html.xpath('//title').inner_text

    if title.empty?
      return "No <title> tag found."
    else
      return title
    end
  end
end
