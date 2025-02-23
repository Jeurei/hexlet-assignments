# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    return [status, headers, body] unless status == 200

    body_content = body.to_a

    signature = Digest::SHA256.hexdigest(body_content.join)

    new_body = body_content + ["\n#{signature}"]

    headers['Content-Length'] = new_body.join.bytesize.to_s if headers['Content-Length']

    [status, headers, new_body]
  ensure
    body.close if body.respond_to?(:close)
  end
end
