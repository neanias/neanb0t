require 'open-uri'
require 'cinch'
require 'nokogiri'

##################################
#  This is now handled by title  #
##################################

class YouTube
  include Cinch::Plugin

  match /(https?:\/\/)?(www.)?youtu\.?be(\.com)?\/(watch\?v=)?(.*)$/i

  def execute(msg)
    # msg.reply msg
    url = msg.params.last
    prepend_protocol(url) unless has_protocol?(url)

    msg.reply "Title of that youtube video: #{get_title(url)}"
  end

  def has_protocol?(url)
    url.start_with? 'http'
  end

  def prepend_protocol(link)
    link.prepend('http://')
  end

  def get_title(link)
    html = Nokogiri::HTML(open(link))
    title = html.xpath('//title')[0].inner_text

    title.chomp(' - YouTube')
  end
end
