# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

URL = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
POST_URL = 'https://rails-collective-blog-ru.hexlet.app/users'

class Hacker
  class << self
    def hack(email, password)
      page = Nokogiri::HTML(URI.open(URL))
      token = page.at_css('meta[name="csrf-token"]')['content']
      uri = URI(URL)
      response = Net::HTTP.get_response(uri)

      cookies = response.get_fields('set-cookie')

      form_data = URI.encode_www_form({
                                        'user[email]' => email,
                                        'user[password]' => password,
                                        'user[password_confirmation]' => password,
                                        'authenticity_token' => token
                                      })

      headers = {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Cookie' => cookies.join('; ')
      }

      post_uri = URI(POST_URL)
      Net::HTTP.start(post_uri.host, post_uri.port, use_ssl: true) do |http|
        request = Net::HTTP::Post.new(post_uri.request_uri, headers)
        request.body = form_data
        http.request(request)
      end
    end
  end
end
