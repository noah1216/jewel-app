class MyUsersController < ApplicationController
  before_action :return_home, except: [:edit, :update]

  def show
    @user = User.find(params[:id])

    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのitem_idカラムを取得
    @favorite_list = Item.find(favorites)
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

  def return_home
    unless user_signed_in?
      redirect_to root_path
    end 
  end

  def user_params
  params.require(:user).permit(:email, :nickname, :family_name, :first_name, :family_n_k, :first_n_k, :text)
  end
end
