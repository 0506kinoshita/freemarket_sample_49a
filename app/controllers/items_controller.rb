class ItemsController < ApplicationController
  WOMAN    = 1
  MAN      = 2
  BABYKIDS = 3
  INTERIOR = 4
  BOOKS    = 5
  HOBYS    = 6
  COSME    = 7

  WOMAN.freeze
  MAN.freeze
  BABYKIDS.freeze
  INTERIOR.freeze
  BOOKS.freeze
  HOBYS.freeze
  COSME.freeze

  def index
    @item = Item.order("created_at DESC").limit(4)
    @items_for_woman = Category.get_category_items(WOMAN).first(4)
    @items_for_man = Category.get_category_items(MAN).first(4)
    @items_for_babykids = Category.get_category_items(BABYKIDS).first(4)
    @items_for_hobys = Category.get_category_items(HOBYS).first(4)
    @items_for_cosme = Category.get_category_items(COSME).first(4)
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
    params.require(:item).permit(:image, :name, :detail, :category, :condition, :delivery_fee, :prefecture_id, :shipment_day, :price, :category_id)
  end
end
