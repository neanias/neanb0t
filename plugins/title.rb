require 'uri'
require 'open-uri'
require 'net/http'
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
          begin
            title = get_title(url)
            endpoint = get_url(url)
            unless title.nil?
              msg.reply "#{title} - #{endpoint}"
            end
          rescue TypeError
            fixed_url = url.gsub('http://', 'https://')
            title = get_title(fixed_url)
            endpoint = get_url(fixed_url)
            unless title.nil?
              msg.reply "#{title} - #{endpoint}"
            end
          rescue => e
            puts e
            next
          end
        end
      end
    end
  end

  def get_title(url)
    html = Nokogiri.parse(open(url, redirect: true))
    html.title
  end

  def get_url(url)
    uri = URI(url)

    res = Net::HTTP.get_response(uri)

    return res['location'] ? res['location'] : url
  end
end
