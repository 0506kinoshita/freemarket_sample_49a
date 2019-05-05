class ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :desc) .limit(4)
  end

  def new
    @item = Item.new 
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category, :condition, :delivery_fee, :prefecture, :shipment_day, :price)
  end
end
