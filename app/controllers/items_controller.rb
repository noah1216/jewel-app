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


  def edit
    @item = Item.find(params[:id])
    if current_seller != @item.seller 
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end



  private



  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :area_id, :shopping_fee_id, :shopping_day_id,
                                 :price).merge(seller_id: current_seller.id)
  end
end
