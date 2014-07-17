require 'uri'
require 'cinch'
require 'httparty'

class IMDb
  include Cinch::Plugin
  include HTTParty

  JSON_HASH = { symbolize_keys: true }

  base_uri 'http://www.omdbapi.com'

  match /!imdb ?(.*)/i

  def execute(msg, query)
    if query.empty?
      msg.reply "Nothing specified for IMDb lookup"
    else
      api_response = query_api(query)

      if search_failed? api_response
        msg.reply "#{query} couldn't be found."
      else
        best_match = api_response[:Search][0]
        imdb_record = get_data(best_match[:imdbID])

        format_film(msg, imdb_record)
      end
    end
  end

  def query_api(query)
    escaped_query = URI.escape(query)
    raw_return = self.class.get("/?s=#{escaped_query}")

    JSON.parse(raw_return, JSON_HASH)
  end

  def search_failed?(hash)
    (hash.has_key?(:Error) || hash[:Response] = "False")
  end

  def get_data(imdb_id)
    raw_json = self.class.get("/?i=#{imdb_id}")

    JSON.parse(raw_json, JSON_HASH)
  end

  def format_film(msg, film_hash)
    msg.reply "#{film_hash[:Title]} (#{film_hash[:Year]})"
    if film_hash[:Metascore] && film_hash[:imdbRating]
      msg.reply "Metascore:   #{film_hash[:Metascore]}"
      msg.reply "IMDb rating: #{film_hash[:imdbRating]}"
    elsif film_hash[:Metascore] && !film_hash[:imdbRating]
      msg.reply "Metascore: #{film_hash[:Metascore]}"
    elsif film_hash[:imdbRating] && !film_hash[:Metascore]
      msg.reply "IMDb rating: #{film_hash[:imdbRating]}"
    end
  end
end
