class ProfilesController < ApplicationController

  def show
  end

  def edit
  end

  def update
    current_user.avatar.store!(params[:avatar]) # nie działało z save, ale działa ze store - save uwalniało callbacki i kasowało plik z Dropboxa zaraz po dodaniu
    redirect_to profile_path
  end
end