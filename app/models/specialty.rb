class Specialty 
	include Mongoid::Document
  	include Mongoid::Timestamps
  	include Mongoid::Attributes::Dynamic

	has_many :bodyparts, inverse_of: :specialty
	embeds_many :bodyparts, cascade_callbacks: true

	field :name, type: String

	def self.import(file)
		#CSV.foreach(file.path) do |row|
		#	Specialty.create! row
		#end

		n = SmarterCSV.process(file) do |array|
      # we're passing a block in, to process each resulting hash / =row (the block takes array of hashes)
      # when chunking is not enabled, there is only one hash in each array
      Specialty.create( array.first )
end

	end
end
