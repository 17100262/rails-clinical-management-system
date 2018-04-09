class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :count_unread, except: [:create]
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:organization,:gender,:user_type,:about_me,:profile_picture])
  end
  
  
  def count_unread
    @count = []
    if current_user
      user_chats = current_user.chats.includes(:messages)
      user_chats.each do |chat|
        @count << chat.messages.where.not(user_id: current_user.id,read: true).count
      end
      @count = @count.sum
    end
  end
end
