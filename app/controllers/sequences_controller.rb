class SequencesController < ApplicationController
   before_action :load_specialty
   before_action :load_bodypart
   before_action :load_study
   before_action :load_device
   before_action :load_protocol


   before_action :set_sequence, only: [:show, :edit, :update, :destroy]


	def index
  		@sequences = @protocol.sequences.all
	end

  	def new
  		@sequence= @protocol.sequences.build
  	end

  	def create
  		@sequence= @protocol.sequences.build(sequence_params)
 
  		@sequence.save
  		redirect_to action: 'index'
  	end

  	def import
    uploaded_file = params[:upload]
    file=uploaded_file.path()
    Specialty.import(file)
    end

    def show
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

  def load_protocol
    @protocol = @device.protocols.find(params[:protocol_id])
  end

   def set_sequence
    @sequence = @protocol.sequences.find(params[:id])
  end

  def sequence_params
    params.require(:sequence).permit(:name)
  end
end
