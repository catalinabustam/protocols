class Device 
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :study
  has_many :protocols
end
