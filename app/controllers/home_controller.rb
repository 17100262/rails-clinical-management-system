class HomeController < ApplicationController
    before_action :authenticate_user!
    def home
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def admin
        # render :layout => false
        # byebug
    end
end
