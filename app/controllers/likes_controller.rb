class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @post = Post.find(params[:post_id])
    @post.like(current_user)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def destroy
    @post = Like.find(params[:id]).post
    @post.unlike(current_user)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
end
