class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private



  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :area_id, :shopping_fee_id, :shopping_day_id,
                                 :price).merge(seller_id: current_seller.id)
  end
end
