class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      puts 'save'
    else
      pusts 'nooooooooooo'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id, comments_counter: 0, likes_counter: 0)
  end
end
