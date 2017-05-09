class UsersController < ApplicationController
  include ChessStoreHelpers::Cart
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # authorize_resource

  def index
    @users = User.alphabetical.paginate(:page => params[:page]).per_page(7)
  end

  def show
    @order_history = Order.for_user(@user.id)
    # @user_assignments = @user.assignments.active.by_project
    # @created_tasks = Task.for_creator(@user.id).by_name
    # @completed_tasks = Task.for_completer(@user.id).by_name
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Thank you for signing up!"
      create_cart
    else
      flash[:error] = "This user could not be created."
      render "new"
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.proper_name} is updated."
      
      if !@user.role?(:admin)
        redirect_to user_path(@user)
      else
        redirect_to @user
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed #{@user.proper_name} from A&M."
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if current_user && current_user.role?(:admin)
        params.require(:user).permit(:first_name, :last_name, :email, :username, :phone, :password, :password_confirmation, :role, :active)  

      else
        # params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :active)
        params.require(:user).permit(:first_name, :last_name, :email, :username, :phone, :password, :password_confirmation, :active, :role)
      end
    end
end
