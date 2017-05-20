class UsersController < ApplicationController
  before_action :user_login_check

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to @bus
  end

  private
  def user_params
    params.require(:user).permit(:login, :password, :role)
  end
end
