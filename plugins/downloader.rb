require 'cinch'
require 'uri'

class FileDownloader
  include Cinch::Plugin

  match /^!gimme (#{URI.regexp})/i

  BASE_DIR = '/Users/williammathewson/Programming/Ruby/neanb0t'
  CACHE = File.join(BASE_DIR, 'cache')

  def execute(msg, query)
    unless query.empty?
      urls = URI.extract(query)
      downloaded_files = []

      urls.each do |url|
        download_file(url)

        downloaded_files.push(extract_filename(url))
      end

      User(msg.user.nick).send(
        "I've got stuff for you: #{downloaded_files}")

      downloaded_files.each do |df|
        msg.user.dcc_send(File.open(File.join(CACHE, df)))
      end
    end
  end

  def download_file(url)
    unless File.exists? 'cache/'
      Dir.mkdir(CACHE)
    end

    Dir.chdir(CACHE) do
      log_file = "#{BASE_DIR}/logs/wget_log"

      unless Dir.entries(Dir.pwd).include? extract_filename(url)
        `wget -a #{log_file} #{url}`
      end
    end
  end

  def extract_filename(url)
    break_it_down = url.split('/')

    break_it_down.last
  end
end
