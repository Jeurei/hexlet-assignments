# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    locale = extract_locale_from_env(env)

    I18n.locale = locale || I18n.default_locale

    status, headers, response = @app.call(env)

    headers['X-Locale'] = I18n.locale.to_s

    [status, headers, response]
  end

  private

  def extract_locale_from_env(env)
    if env['HTTP_ACCEPT_LANGUAGE']
      requested_locale = env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first

      return requested_locale if I18n.available_locales.map(&:to_s).include?(requested_locale)
    end

    nil
  end
end
