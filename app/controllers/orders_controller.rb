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
    @order.grand_total = calculate_cart_items_cost

    if @order.save
      @order.pay
      save_each_item_in_cart(@order)
      clear_cart
      redirect_to home_path, notice: "Thank you for placing an order!"
    else
      flash[:error] = "This order could not be placed."
      render "new"
    end
  end

  # def new
  #   session[:order_params] ||= {}
  #   @order = Order.new(session[:order_params])
  #   @order.current_step = session[:order_step]
  # end

  # def create
  #   session[:order_params].deep_merge!(params[:order]) if params[:order]
  #   @order = Order.new(session[:order_params])
  #   @order.current_step = session[:order_step]
  #   if @order.valid?
  #     if params[:back_button]
  #       @order.previous_step
  #     elsif @order.last_step?
  #       @order.save if @order.all_valid?
  #     else
  #       @order.next_step
  #     end
  #     session[:order_step] = @order.current_step
  #   end
  #   if @order.new_record?
  #     render "new"
  #   else
  #     session[:order_step] = session[:order_params] = nil
  #     flash[:notice] = "Order saved!"
  #     redirect_to @order
  #   end
  # end


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
