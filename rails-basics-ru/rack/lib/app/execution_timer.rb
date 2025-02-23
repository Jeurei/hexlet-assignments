# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now

    status, headers, body = @app.call(env)

    execution_time = Time.now - start_time

    headers['X-Execution-Time'] = "#{(execution_time * 1000).round(2)}ms"

    [status, headers, body]
  end
end
