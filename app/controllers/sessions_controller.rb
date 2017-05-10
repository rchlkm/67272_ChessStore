class SessionsController < ApplicationController
  include ChessStoreHelpers::Cart
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    puts "=====",user
    if user && user.authenticate(params[:password])
    # if user && User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      # if user.role?("customer")
      #   create_cart
      # end
      redirect_to home_path, notice: "Logged in!"
      create_cart
    else
      puts "LOG IN FAILED!!!"
      flash.now.alert = "Email or password is invalid"
      render "new", as: :login
    end
  end

  def destroy
    destroy_cart
    session[:user_id] = nil
    redirect_to home_path, notice: "Logged out!"
  end
end