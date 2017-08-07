class ProfilesController < ApplicationController
  def show
    unless current_user.present?
      redirect_to new_session_path, alert: 'You have to be logged in if you want to see your profile!'
    end
  end
end