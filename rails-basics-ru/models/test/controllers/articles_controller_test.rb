require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index,show' do
    get articles_index, show_url
    assert_response :success
  end
end
