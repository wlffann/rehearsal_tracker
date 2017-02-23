class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save 
      flash[:success] = "Welcome! Your account was created."
      redirect_to user_path(user)
    else
      flash[:danger] = "Please fill in all required fields"
      render :new
    end
  end

  private

    def user_params
      params.require('user').permit('name', 'email', 'slack_name', 'image_url', 'password', 'password_confirmation')
    end
end
