class SpecialtiesController < ApplicationController

  before_action :set_specialty, only: [:show, :edit, :update, :destroy]
  def index
  	@specialties = Specialty.all
  end
  def new
  	@specialty = Specialty.new
  end

  def create
  @specialty = Specialty.new(specialty_params)
 
  @specialty.save
  redirect_to action: 'index'
  end

  def import
    uploaded_file = params[:upload]
    file=uploaded_file.path()
    Specialty.import(file)
  end

  def update
    @specialty.update_attributes(specialty_params)
    redirect_to action: 'index'
  end

  def destroy  
    @specialty.destroy
    redirect_to action: 'index' 
  end


  private


  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def specialty_params
    params.require(:specialty).permit(:name)
  end


end
