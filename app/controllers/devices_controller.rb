class DevicesController < ApplicationController
   before_action :load_specialty
   before_action :load_bodypart
   before_action :load_study
   before_action :set_device, only: [:show, :edit, :update, :destroy]


	def index
  		@devices = @study.devices.all
	end

  	def new
  		@device = @study.devices.build
  	end

  	def create
  		@device= @study.devices.build(device_params)
 
  		@device.save
  		redirect_to action: 'index'
  	end

  


  private


  def load_specialty
    @specialty = Specialty.find(params[:specialty_id])
  end

  def load_bodypart
    @bodypart = @specialty.bodyparts.find(params[:bodypart_id])
  end

  def load_study
    @study = @bodypart.studies.find(params[:study_id])
  end

  def set_device
    @device = @study.devices.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name)
  end


end
