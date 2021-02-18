class MySellersController < ApplicationController
  before_action :return_home, except: [:edit, :update]

  def show
    @seller = Seller.find(params[:id])
    @items = @seller.items
  end

  def edit
    @seller = Seller.find(params[:id])
    unless @seller == current_seller
      redirect_to my_seller_path(@seller)
    end
  end


  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      redirect_to my_seller_path(current_seller)
    else
      render :edit
    end
  end


  private

  def return_home
    unless seller_signed_in?
      redirect_to root_path
    end 
  end

  def seller_params
  params.require(:seller).permit(:email, :nickname, :family_name, :first_name, :family_n_k, :first_n_k, :text)
  end
end

