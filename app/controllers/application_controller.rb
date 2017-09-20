class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

 def authorize_user
    if current_user.blank?
      redirect_to new_session_path, alert: 'Please log in first!'
    end
  end 
end
 # ... jeżeli jestem zalogowana to do jakich routesów mam mieć dostęp, 
 # a jeśli nie zalogowana, to przenieść na sign in lub sign up, 
 # nie wiadomo ile metod, może trzeba użyć skip before action
  