class ApplicationController < ActionController::Base

    helper_method(:current_user)
  
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end
  
    def require_login
      if !current_user
        flash[:message] = "You must be logged in to view that!"
        redirect_to '/login' 
      end
    end
  
  end  