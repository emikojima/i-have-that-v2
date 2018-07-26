class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
    before_action :require_login, only: [:show, :index, :edit, :all]
  def current_user
    user ||= User.find_by(id: session[:user_id])
  end

    def logged_in?
      current_user != nil
    end

    def require_login
     unless logged_in?
       @error = "You must be logged in to access this section"
       redirect_to '/'
     end
   end
end
