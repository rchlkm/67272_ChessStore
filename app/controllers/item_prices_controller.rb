class ItemPricesController < ApplicationController
  def index
    @active_items = Item.active.alphabetical.to_a
  end

  def new
    @item_price = ItemPrice.new
  end

  def create
    @item_price = ItemPrice.new(item_price_params)
    @item_price.start_date = Date.current
    if @item_price.save
      @item = @item_price.item
      redirect_to item_path(@item), notice: "Changed the price of #{@item.name}."
    else
      render action: 'new'
    end

    respond_to do |format|
      if @item_price.save
        format.html { redirect_to @item_price, notice: 'Attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_price }
        @item = @item_price.item
        @item_prices = @item.item_prices.wholesale.chronological.to_a
        # @town = @attraction.town
        # @attractions = @town.attractions.alphabetical.to_a
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @item_price.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  def item_price_params
    params.require(:item_price).permit(:item_id, :price, :category)
  end
  
end