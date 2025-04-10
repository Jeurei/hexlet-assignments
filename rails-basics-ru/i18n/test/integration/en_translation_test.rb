# frozen_string_literal: true

require 'test_helper'

class EnTranslationTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts :without_comments
    @locale = :en

    @post_attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote
    }

    @post_comment_attrs = {
      body: Faker::Movies::Lebowski.quote
    }
  end

  test 'home#index' do
    get root_path(locale: @locale)

    assert_select 'h1', text: 'Home page'
    assert_select 'ul.nav', text: /Home/
    assert_select 'ul.nav', text: /Posts/
    assert_select 'footer', text: /Hexlet/
  end
end
