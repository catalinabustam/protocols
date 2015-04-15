class Study 
  include Mongoid::Document
  include Mongoid::Timestamps
  #belongs_to :bodypart
  #has_many :devices, inverse_of: :study
  embeds_many :devices, cascade_callbacks: true
  embedded_in :bodypart, inverse_of: :studies

  field :name, type: String

end
