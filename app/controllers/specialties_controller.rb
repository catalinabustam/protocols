class SpecialtiesController < ApplicationController
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


  private
  def specialty_params
    params.require(:specialty).permit(:name)
  end
end
