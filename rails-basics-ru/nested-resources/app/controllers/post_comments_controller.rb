# frozen_string_literal: true

class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: %i[show edit update destroy]
  before_action :set_post, only: %i[new create]

  # GET /post_comments or /post_comments.json
  def index
    @post_comments = PostComment.all
  end

  # GET /post_comments/1 or /post_comments/1.json
  def show; end

  # GET /post_comments/new
  def new
    @post_comment = @post.post_comments.build
  end

  # GET /post_comments/1/edit
  def edit; end

  # POST /post_comments or /post_comments.json
  def create
    @post_comment = @post.post_comments.build(post_comment_params)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to @post, notice: 'Post comment was successfully created.' }
        format.json { render :show, status: :created, location: @post_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_comments/1 or /post_comments/1.json
  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to @post_comment.post, notice: 'Post comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_comments/1 or /post_comments/1.json
  def destroy
    post = @post_comment.post
    @post_comment.destroy!

    respond_to do |format|
      format.html do
        redirect_to post, status: :see_other, notice: 'Post comment was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post_comment
    @post_comment = PostComment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
