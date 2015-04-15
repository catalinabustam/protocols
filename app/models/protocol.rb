class Protocol
  include Mongoid::Document
  include Mongoid::Timestamps	

  #belongs_to :device
  has_many :sequences
  embedded_in :device, inverse_of: :protocols

  field :name, type: String
end
