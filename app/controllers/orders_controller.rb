class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :if_redirect, only: [:index, :create] 


  def index
    @settlement = Settlement.new
  end


  def create
    @settlement = Settlement.new(settlement_params) 
    if @settlement.valid?
      pay_item
      @settlement.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: settlement_params[:token],  
      currency: 'jpy'               
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def if_redirect
    if @item.order != nil
      redirect_to root_path
    end
  end

  def settlement_params
  params.require(:settlement).permit(:postal_code, :area, :city, :house_number, :block_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
