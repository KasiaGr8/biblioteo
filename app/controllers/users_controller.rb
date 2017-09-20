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
      redirect_to profile_path, notice: "Welcome to Biblioteo!"
    else
      render :new
    end
  end
end

private

def user_params
  params.permit(:name, :email, :password, :password_confirmation)
end

