class CartsController < ApplicationController
	def show
		@cart = current_order.order_items
	end

	def add_to_cart
	   # current_cart.add_item(params[:item_id])
	   # redirect_to carts_path(current_cart.id)
	end

 end
