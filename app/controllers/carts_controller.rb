class CartsController < ApplicationController
	def show
	 @cart = current_cart
	end

	def add_to_cart
	   # current_cart.add_item(params[:item_id])
	   # redirect_to carts_path(current_cart.id)
	end

 end
