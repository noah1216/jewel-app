class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :if_redirect, only: [:index, :create] 


  def index
    @item = Item.find(params[:item_id])
    @settlement = Settlement.new
  end


  def create
    @item = Item.find(params[:item_id])
    @settlement = Settlement.new(settlement_params) 
    if @settlement.valid?
      @settlement.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def if_redirect
    if current_user == @item.user || @item.order != nil
      redirect_to root_path
    end
  end

  def settlement_params
  params.require(:settlement).permit(:postal_code, :area, :city, :house_number, :block_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
