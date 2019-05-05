class ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :desc) .limit(4)
    # binding.pry
  end

end
