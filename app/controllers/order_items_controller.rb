class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  # authorize_resource
  
  def new
    @order_item = OrderItem.new
    authorize! :new, @order_item
    @order_item.order_id = params[:order_id] unless params[:order_id].nil?
  end

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id

    # @order_item = OrderItem.new(task_params)
    # authorize! :create, @order_item
    # # @order_item.order_id = current_user.id
    # if @order_item.save
    #   # if saved to database
    #   flash[:notice] = "#{@order_item.item.name} has been added to cart."
    #   redirect_to @ # go to show task page
    # else
    #   # return to the 'new' form
    #   render :action => 'new'
    # end
  end

  def edit
    authorize! :edit, @order_item
    if params[:shipped_on] == Date.current
      @order_item.save!
      flash[:notice] = "#{@order_item.item.name} has been shipped."
      
      puts "==== redirect_to"
      redirect_to home_path

      # if params[:from] == 'project'
      #   redirect_to project_path(@order_item.project)
      # else
      #   redirect_to home_path
      # end
    else
      
    end

  end

  def update
    # @order = current_order
    # @order_item = @order.order_items.find(params[:id])
    # @order_item.update_attributes(order_item_params)
    # @order_items = @order.order_items


    authorize! :update, @order_item
    # params[:order_item].each { |attribute,value| @order_item[attribute] = value }
    @order_item.shipped_on = Date.current

    if @order_item.save!
      flash[:notice] = "#{@order_item.item.name} has been shipped."
      redirect_to :back
    else
      render :action => 'edit'
    end
  end

  def destroy
    authorize! :destroy, @order_item
    @order_item.destroy
    flash[:notice] = "Successfully removed #{@order_item.item.name} from the order."
    redirect_to home_path
  end
	
	private
  def set_order_item
      @order_item = OrderItem.find(params[:id])
    end
  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
end