class LikesController < ApplicationController
  def create
    like = Like.new(post_id: params[:post_id], author_id: params[:post_author_id])
    unless like.save
      flash[:error] = 'Error. Please try again'
    end
    redirect_to user_post_path(params[:post_author_id], params[:post_id])
  end
end
