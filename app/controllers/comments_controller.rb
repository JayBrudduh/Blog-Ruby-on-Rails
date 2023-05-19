class CommentsController < ApplicationController
  def new
  end

  def create
    comment = Comment.new(post_params)
    unless comment.save
      flash[:error] = 'Error. Please try again'
    end
    redirect_to user_post_path(params[:comment][:post_author_id], params[:comment][:post_id])
  end

  private

  def post_params
    params.require(:comment).permit(:text, :post_id).merge(author_id: current_user.id, post_id: params[:comment][:post_id])
  end
end
