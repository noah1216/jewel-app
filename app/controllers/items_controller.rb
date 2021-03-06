class ItemsController < ApplicationController
  before_action :return_home, except: [:index, :show]
  
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
    @comment = Comment.new
    @comments = @item.comments
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
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if current_seller == @item.seller
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  def search
    @items = Item.search(params[:keyword])
  end


  private

  def return_home
    unless seller_signed_in? || user_signed_in?
      redirect_to root_path
    end 
  end


  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :area_id, :shopping_fee_id, :shopping_day_id,
                                 :price).merge(seller_id: current_seller.id)
  end
end
