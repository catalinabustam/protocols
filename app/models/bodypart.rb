class Bodypart
  include Mongoid::Document
  include Mongoid::Timestamps
  #belongs_to :specialty
  #has_many :studies, inverse_of: :bodypart
  embeds_many :studies, cascade_callbacks: true
  embedded_in :specialty, inverse_of: :bodyparts

  field :name, type: String

end
