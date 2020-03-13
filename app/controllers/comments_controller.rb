class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action

  def create
    @post = Post.find(params[:comment][:commented_id])
    comment = @post.comments.build(comment_params)
    if comment.save
      redirect_to post_path(@post)
      flash[:success] = "Comment posted."
    else
      render 'static_pages/home'
    end
  end

  def destroy
    # no
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter_id, :commented_id, :comment)
    end
end
