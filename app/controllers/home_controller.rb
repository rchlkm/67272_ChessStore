class HomeController < ApplicationController
  def home
    @items = Item.active.alphabetical.to_a
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
    @orders_to_ship = Order.not_shipped.to_a
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end