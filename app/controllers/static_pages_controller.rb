class StaticPagesController < ApplicationController
  def home
    @posts = current_user.feed.page(params[:page]) if logged_in?
    # @comments = @posts.each do |post|
    #   post.comments.all
  end

  def about
  end

  def contact
  end
end
