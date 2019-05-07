class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.order(created_at: :desc).limit(4)
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
    params.require(:item).permit(:image, :name, :detail, :category, :condition, :delivery_fee, :prefecture, :shipment_day, :price)
  end
end
