class ItemsController < ApplicationController

  WOMAN    = 1
  MAN      = 2
  BabyKids = 3
  Interior = 4
  Books    = 5
  Hobys    = 6
  Cosme    = 7
  

  def index
    @item = Item.order("created_at DESC").limit(4)
    @items_for_woman = Category.get_category_items(WOMAN)
    @items_for_man = Category.get_category_items(MAN)
    @items_for_BabyKids = Category.get_category_items(BabyKids)
    @items_for_Hobys = Category.get_category_items(Hobys)
    @items_for_Cosme = Category.get_category_items(Cosme)
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
