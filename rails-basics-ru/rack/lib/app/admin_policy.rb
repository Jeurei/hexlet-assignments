# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    return [403, {}, []] if request.path.start_with? '/admin'

    @app.call(env)
  end
end
