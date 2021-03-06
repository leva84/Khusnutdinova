class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :show]
  before_action :set_user, only: [:show, :destroy, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user_name = @user.name
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
