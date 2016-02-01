class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
 
  def new
    @subreddit = Subreddit.find(params[:subreddit_id])
  end
  
  def create
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = @subreddit.posts.build(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      flash[:success] = "Your post was created."
      redirect_to subreddit_path(@subreddit)
    else
      render :new
    end
  end
  
  def destroy
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = @subreddit.posts.find(params[:id])
    unless current_user == @post.user
        flash[:alert] = "This post doesn't belong to you!"
        redirect_to root_path
    end
    @post.destroy
    flash[:success] = "Post destroyed."
    redirect_to subreddit_path(@subreddit)
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
  
end
