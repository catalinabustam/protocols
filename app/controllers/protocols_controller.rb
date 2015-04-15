class ProtocolsController < ApplicationController
   before_action :load_specialty
   before_action :load_bodypart
   before_action :load_study
   before_action :load_device

   before_action :set_protocol, only: [:show, :edit, :update, :destroy]


	def index
  		@protocols = @device.protocols.all
	end

  	def new
  		@protocol= @device.protocols.build
  	end

  	def create
  		@protocol= @device.protocols.build(protocol_params)
 
  		@protocol.save
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

  def load_device
    @device = @study.devices.find(params[:device_id])
  end

  def set_protocol
    @protocol = @device.protocols.find(params[:id])
  end

  def protocol_params
    params.require(:protocol).permit(:name)
  end


end
