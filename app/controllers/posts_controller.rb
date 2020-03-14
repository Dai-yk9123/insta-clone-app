class PostsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @post = Post.find(params[:id])
    @posts = @post.user.posts.page(params[:page])
    @comments = @post.comments.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Picture uploaded!"
      redirect_to current_user
    else
      render new_post_path
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Picture deleted."
    redirect_to current_user
  end

  private

    def post_params
      params.require(:post).permit(:picture, :content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
