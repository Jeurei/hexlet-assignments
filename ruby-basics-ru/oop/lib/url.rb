# frozen_string_literal: true

# BEGIN

require 'forwardable'
require 'uri'

class Url
  extend Forwardable

  attr_reader :url, :uri

  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @url = url.to_s
    @uri = URI.parse(@url)
  end

  def query_params
    return {} unless uri.query

    uri.query.split('&').each_with_object({}) do |param, hash|
      key, value = param.split('=')
      hash[key.to_sym] = value
    end
  end

  def query_param(key, default = nil)
    params = query_params
    return default unless params

    params.key?(key) ? params[key] : default
  end

  def ==(other)
    return false unless other.is_a?(Url)

    scheme == other.scheme && host == other.host && port == other.port && query_params == other.query_params
  end

  def !=(other)
    !(self == other)
  end
end

# END
