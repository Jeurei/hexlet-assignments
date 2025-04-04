# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post_comment = post_comments(:one)
  end

  test 'should get new' do
    get new_post_comment_url(@post_comment.post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_comment_url(@post_comment.post, @post_comment)
    assert_response :success
  end

  test 'should update post_comment' do
    patch comment_url(@post_comment),
          params: { post_comment: { comment: @post_comment.comment } }
    assert_redirected_to post_url(@post)
  end
end
