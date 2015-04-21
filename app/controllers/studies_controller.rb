class StudiesController < ApplicationController
   before_action :load_specialty
   before_action :load_bodypart
   before_action :set_study, only: [:show, :edit, :update, :destroy]


	def index
  		@studies = @bodypart.studies.all
	end

	def new
		@study = @bodypart.studies.build
	end
	def create
		@study= @bodypart.studies.build(study_params)

		@study.save
		redirect_to action: 'index'
	end

  def update
    @study.update_attributes(study_params)
    redirect_to action: 'index'
  end

  def destroy  
    @study.destroy
    redirect_to action: 'index' 
  end

  


  private


  def load_specialty
    @specialty = Specialty.find(params[:specialty_id])
  end

    def load_bodypart
    @bodypart = @specialty.bodyparts.find(params[:bodypart_id])
  end

  def set_study
    @study = @bodypart.studies.find(params[:id])
  end

  def study_params
    params.require(:study).permit(:name)
  end



end
