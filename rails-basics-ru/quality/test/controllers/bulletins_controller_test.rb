class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'bulletin#index' do
    get bulletins_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'a', bulletins(:one).title
  end

  test 'bulletin#show' do
    get bulletin_path(bulletins(:one))

    assert_response :success
    assert_select 'h1', bulletins(:one).title
  end
end
