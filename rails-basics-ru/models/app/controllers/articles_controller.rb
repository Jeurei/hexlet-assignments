# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.to_a
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
