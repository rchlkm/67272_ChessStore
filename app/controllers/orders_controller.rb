class OrdersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@order = Order.new
	end

	def create
    @order = Order.new(order_params)
    @order.date = Date.current
    # @order.user_id = session[:user_id]
    @order.user_id = current_user
    if @order.save
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
  	params.require(:order).permit(:school_id, :grand_total, :payment_receipt)
  end
end
