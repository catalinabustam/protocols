class Device 
  include Mongoid::Document
  include Mongoid::Timestamps
  #belongs_to :study
  #has_many :protocols, inverse_of: :device
  embeds_many :protocols, cascade_callbacks: true
  embedded_in :study, inverse_of: :devices

  field :name, type: String
end
