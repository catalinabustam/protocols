class BodypartsController < ApplicationController

   before_action :load_specialty
   before_action :set_bodypart, only: [:show, :edit, :update, :destroy]


	def index
  	bodyparts = @specialty.bodyparts.all
	end

  def new
  	@bodypart = @specialty.bodyparts.build
  end

  def create
  	@bodypart= @specialty.bodyparts.build(bodypart_params)
 
  	@bodypart.save
  	redirect_to action: 'index'
  end

  def update
    @bodypart.update_attributes(bodypart_params)
    redirect_to action: 'index'
  end

  def destroy  
    @bodypart.destroy
    redirect_to action: 'index' 
  end


  


  private


  def load_specialty
    @specialty = Specialty.find(params[:specialty_id])
  end

  def set_bodypart
    @bodypart = @specialty.bodyparts.find(params[:id])
  end

  def bodypart_params
    params.require(:bodypart).permit(:name)
  end


end
