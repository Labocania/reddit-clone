class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def index
    @comments = Comment.all
  end
end
