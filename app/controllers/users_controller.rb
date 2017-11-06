class UsersController < ApplicationController
  
  skip_before_action :authorize_user #zeby w ogole mozna bylo sie zarejestrowac

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_sms_token!
      redirect_to new_sms_confirmation_path
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :phone)
  end
end