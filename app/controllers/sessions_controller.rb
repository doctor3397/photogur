class SessionsController < ApplicationController
  def new
  end

  # log in user
  def create
    user = User.find_by(email: session_params[:email])

    #authenticate
    if user && user.authenticate(session_params[:password])
      flash[:notice] = 'Successfully logged in!'
      #store the user id in the session
      session[:user_id] = user.id
      redirect_to root_url

    # failed to authenticate
    else
      flash.now[:alert] = 'Try again :('
      render :new
    end

  end


  # log out user
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're logged out!"
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
