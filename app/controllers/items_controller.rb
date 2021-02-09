class ItemsController < ApplicationController
  def index
    # items = Item.order('created_at DESC')
      items = Item.all
    if items.length < 8
      @items = items.order('created_at DESC')
    else
      @items = Item.last(8).reverse
    end
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

  def show
    @item = Item.find(params[:id])
  end


  private



  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :area_id, :shopping_fee_id, :shopping_day_id,
                                 :price).merge(seller_id: current_seller.id)
  end
end
