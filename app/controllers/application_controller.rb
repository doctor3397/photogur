class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    ## code to ensure user is logged in
  end

  # We can put methods we want accessible to multiple controllers in the ApplicationController as they'll all inherit from them.

  # For example, the following would provide a useful current_user method throughout our controllers:
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
