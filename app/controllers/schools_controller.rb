class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  authorize_resource


  def index
  	@schools = School.active.alphabetical.to_a
  	@inactive_schools = School.inactive.alphabetical.to_a
  end

  def new
    @school = School.new
  end

  def edit
  end

  def create
    @school = School.new(school_params)
    # respond_to do |format|
    #   if @school.save
    #     # @item = @item_price.item
        
    #     format.html { redirect_to checkout_path, notice: 'School was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @school }
    #     format.js
    #   else
    #     # render action: 'new'
    #     format.html { render action: 'new' }
    #     format.json { render json: @school.errors, status: :unprocessable_entity }
    #   end
    # end
    if @school.save
      redirect_to :back
      # redirect_to item_path(@item), notice: "Successfully created #{@item.name}."
    else
      render action: 'new'
    end
  end

  def update
  end

  def destroy
  end
	
	private
	def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :street_1, :street_2, :city, :state, :zip, :min_grade, :max_grade)
  end

end
