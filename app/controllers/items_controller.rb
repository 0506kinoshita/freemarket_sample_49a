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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category, :size, :condition, :delivery_fee, :prefecture_id, :shipment_day, :price).merge(user_id: current_user.id)
  end
end
