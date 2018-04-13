class UsersController < ApplicationController
    before_action :authenticate_user!
    # authorize_resource :class => false
    
    def edit
        @user = User.find(params[:id])
        authorize! :update, @user 
    end
    
    def update
        @user = User.find(params[:id])
        authorize! :update, @user if current_user.id == @user.id
        if @user.update(user_params)
            redirect_to profile_user_path(@user), notice: "User profile updated successfully"
        else
            redirect_to edit_user_path, notice: @user.errors.full_messages.join
        end
    end
    def make_moderator
        @user = User.find(params[:id])
        if @user.moderator?
            @user.user!
        else
            @user.moderator!
        end
        redirect_to users_path, notice: "User has been #{@user.moderator? ? "successfully made moderator": "removed as moderator"}" 
    end
    
    def profile
        @user = User.find(params[:id])
    end
    
    def index
        @users = User.all
    end
    
    def approve_user
        @user = User.find(params[:user_id])
        if @user.update(approved: params[:approved])
            redirect_to admin_path,notice: "User has been updated successfully"
        else
            redirect_to admin_path,notice: "Something went wrong"
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name,:gender,:about_me,:user_type,:organization,:profile_picture, :email)
    end
    
    
end
