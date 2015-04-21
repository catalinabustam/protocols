class SequencesController < ApplicationController
   before_action :load_specialty
   before_action :load_bodypart
   before_action :load_study
   before_action :load_device
   #before_action :load_protocol


   before_action :set_sequence, only: [:show, :edit, :update, :destroy]


	def index
  		#@sequences = @protocol.sequences.all
      @sequences = @device.sequences.all
	end

  def new
  	#@sequence= @protocol.sequences.build
    @sequence= @device.sequences.build
	end

  def create
  	#@sequence= @protocol.sequences.build(sequence_params)
    @sequence= @device.sequences.build(sequence_params)
		@sequence.save
		redirect_to action: 'index'
	end

	def import
    uploaded_file = params[:upload]
    file=uploaded_file.path()
    filename=uploaded_file.original_filename()
    name=File.basename(filename, File.extname(filename))
    text = File.read(file) 
    replace = text.gsub(/ =     /, ",")
    File.open(file, "w") {|fil| fil.puts replace}
    Sequence.import(file,@device,name)
    redirect_to action: 'index'

  end

  def show
    keys_blacklist = %W(created_at updated_at protocol_id _id ) #these are the fields to hide
    @sequence_showlist = @sequence.attributes.except(*keys_blacklist)
  end

  def edit
    keys_blacklist = %W(created_at updated_at protocol_id _id ) #these are the fields to hide
    @sequence_showlist = @sequence.attributes.except(*keys_blacklist)
  end

   def update
    @sequence.update_attributes(sequence_params)
    redirect_to action: 'index'
  end

  def destroy  
    @sequence.destroy
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

  def load_protocol
    @protocol = @device.protocols.find(params[:protocol_id])
  end

   def set_sequence
    @sequence = @device.sequences.find(params[:id])
  end

  def sequence_params
    params.require(:sequence).permit!
  end
end
