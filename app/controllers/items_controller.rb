class ItemsController < ApplicationController

  WOMAN    = 1
  MAN      = 2
  BABYKIDS = 3
  INTERIOR = 4
  BOOKS    = 5
  HOBYS    = 6
  COSME    = 7

  def index
    @item = Item.order("created_at DESC").limit(4)
    @items_for_woman = Category.get_category_items(WOMAN)
    @items_for_man = Category.get_category_items(MAN)
    @items_for_babykids = Category.get_category_items(BABYKIDS)
    @items_for_hobys = Category.get_category_items(HOBYS)
    @items_for_cosme = Category.get_category_items(COSME)
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
    params.require(:item).permit(:image, :name, :detail, :category, :condition, :delivery_fee, :prefecture, :shipment_day, :price, :category_id)
  end
end
