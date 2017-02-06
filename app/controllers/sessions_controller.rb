class SessionsController < ApplicationController
  def new
  end

  # log in user
  def create
    user = User.find_by(email: session_params[:email])

    #authenticate
    if user

      if user.authenticate(session_params[:password])
        flash[:notice] = 'successfully logged in!'
        
        #store the user id in the session
        session[:user_id] = user.id
        redirect_to root_url
      else
        flash.now[:alert] = 'Try again :('
        render :new
      end

    # failed to authenticate
    else
      flash.now[:alert] = 'Try again :('
      render :new
    end
  end

  # log out user
  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
