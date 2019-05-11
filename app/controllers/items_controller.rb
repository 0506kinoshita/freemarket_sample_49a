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
    @item = Item.order("created_at DESC").limit(4).includes(:user).includes(:category)
    @items_for_woman = Category.skim(WOMAN)
    @items_for_man = Category.skim(MAN)
    @items_for_babykids = Category.skim(BABYKIDS)
    @items_for_hobys = Category.skim(HOBYS)
    @items_for_cosme = Category.skim(COSME)
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
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :size, :condition, :delivery_fee, :prefecture_id, :shipment_day, :price).merge(user_id: current_user.id)
  end
end
