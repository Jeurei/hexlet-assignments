# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    [status, headers, body.push("\n#{Digest::SHA256.hexdigest(body.join)}")]
  end
end
