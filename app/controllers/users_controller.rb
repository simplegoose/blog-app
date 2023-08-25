class UsersController < ApplicationController
  # GET /
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def current_user
    @user = User.first
  end
end
