class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order, :current_cart

  # a custom module to handle some issues with dates
  # include DateFormatter # -- not needed now b/c of gem

  # just show a flash message instead of full CanCan exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to take this action.  Go away or I shall taunt you a second time."
    redirect_to home_path
  end
  
  # handle missing pages the BSG way...
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render template: 'errors/not_found'
  end
  

  # def current_order
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end

  # def current_cart
  #   if session[:cart_id]
  #     @current_cart ||= Cart.find(session[:cart_id])
  #   end
  #   if session[:cart_id].nil?
  #     @current_cart = Cart.create!
  #     session[:cart_id] = @current_cart.id
  #   end
  #   @current_cart
  # end 


  private
  # Handling authentication
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def logged_in?
    current_user
  end
  helper_method :logged_in?
  
  def check_login
    redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
  end
end
