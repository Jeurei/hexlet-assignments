# frozen_string_literal: true

require 'test_helper'

class RuTranslationTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:without_comments)
    @locale = :ru

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

    assert_select 'h1', text: 'Домашняя страница'
    assert_select 'ul.nav', text: /Домой/
    assert_select 'ul.nav', text: /Посты/
    assert_select 'footer', text: /Хекслет/
  end
end
