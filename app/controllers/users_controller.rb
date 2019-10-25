class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to movies_path, notice: 'その行為はできません'
  end
end
