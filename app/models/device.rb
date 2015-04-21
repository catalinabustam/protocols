class Device 
  include Mongoid::Document
  include Mongoid::Timestamps
  
  #embeds_many :protocols, cascade_callbacks: true
  has_many :sequences
  embedded_in :study, inverse_of: :devices

  field :name, type: String
end
