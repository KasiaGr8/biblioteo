class SessionsController < ApplicationController

  skip_before_action :authorize_user # zeby w ogole mozna bylo sie zalogowac
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to profile_path
    else
      redirect_to new_session_path, alert: 'Invalid email or password'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: 'Successfully logged out'
  end

end
