class MyUsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to my_user_path(@user)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to my_user_path(current_user)
    else
      render :edit
    end
  end


  private

  def user_params
  params.require(:user).permit(:email, :nickname, :family_name, :first_name, :family_n_k, :first_n_k, :text)
  end
end
