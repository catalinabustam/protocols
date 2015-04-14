class Study 
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :bodypart
  has_many :devices
end
