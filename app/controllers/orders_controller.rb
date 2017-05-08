class OrdersController < ApplicationController
  include ChessStoreHelpers::Cart
	before_action :set_order, only: [:show, :edit, :update, :destroy]

	def show
    # @user_orders = Order.for_user(current_user.id)
	end

	def new
		@order = Order.new
	end

	def create
    @order = Order.new(order_params)
    @order.date = Date.current
    @order.user_id = current_user.id
    if @order.save
      clear_cart
      redirect_to home_path, notice: "Thank you for placing an order!"
    else
      flash[:error] = "This order could not be placed."
      render "new"
    end
  end

  def destroy
    @order.destroy
    flash[:notice] = "Successfully cancelled your order placed on #{@order.date}."
    redirect_to home_path
  end

  private
  def set_order
  	@order = Order.find(params[:id])
  end

  def order_params
  	# params.require(:order).permit(:school_id, :grand_total, :payment_receipt)
     params.require(:order).permit(:school_id, :credit_card_number, :expiration_year, :expiration_month)

  end
end
