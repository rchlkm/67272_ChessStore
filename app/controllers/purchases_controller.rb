class PurchasesController < ApplicationController
  authorize_resource
  
  def index
    @purchases = Purchase.chronological.to_a
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.date = Date.current
    
    # if @purchase.save
    #   redirect_to purchases_path, notice: "Successfully added a purchase for #{@purchase.quantity} #{@purchase.item.name}."
    # else
    #   render action: 'new'
    # end

    respond_to do |format|
      if @purchase.save
        @item = @purchase.item
        format.html { redirect_to item_path(@item), notice: 'Purchase was successfully processed.' }
        format.json { render action: 'show', status: :created, location: @purchase }
        format.js
      else
        # render action: 'new'
        format.html { render action: 'new' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  def purchase_params
    params.require(:purchase).permit(:item_id, :quantity)
  end
  
end