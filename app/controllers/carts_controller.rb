class CartsController < ApplicationController
	include ChessStoreHelpers::Cart

	def show
		@cart_items = get_list_of_items_in_cart
	end

	def add_to_cart
	   add_item_to_cart(params[:id])
	   redirect_to :back
	   # redirect_to cart_path
	end

 end
