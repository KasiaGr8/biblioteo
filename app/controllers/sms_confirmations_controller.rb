class SmsConfirmationsController < ApplicationController
  
  skip_before_action :authorize_user  

  def new
  end

  def create
    user = User.find_by(confirmed: false, sms_token: params[:token])
    if user.present? 
      user.update(confirmed: true)
      redirect_to new_session_path, notice: 'Successful confirmation'
    else
      redirect_to new_sms_confirmation_path, alert: 'Invalid token!'
    end
  end

end