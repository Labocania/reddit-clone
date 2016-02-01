class SubredditsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :owned_subreddit, only: [:destroy]
  
  def front
    @subreddits = Subreddit.all
  end
  
  def new
    @subreddit = current_user.subreddits.build
  end
  
  def create
    @subreddit = current_user.subreddits.build(subreddit_params)
    if @subreddit.save
      flash[:success] = "Subreddit Created!"
      redirect_to @subreddit
    else
      render :new
    end
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end
  
  def destroy
    @subreddit = Subreddit.find(params[:id])
    @subreddit.destroy
    flash[:success] = "Subreddit destroyed."
    redirect_to root_path
  end
  
  private
  
  def subreddit_params
    params.require(:subreddit).permit(:sub_name, :description)
  end
  
    def owned_subreddit
      unless current_user == @subreddit.user
        flash[:alert] = "This subreddit doesn't belong to you!"
        redirect_to root_path
      end
    end
end
