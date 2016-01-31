class ProfilesController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find_by(name: params[:name])
    end
end
