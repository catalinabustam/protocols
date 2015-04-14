class Protocol
  include Mongoid::Document
  include Mongoid::Timestamps	
  belongs_to :device
  has_many :sequences
end
