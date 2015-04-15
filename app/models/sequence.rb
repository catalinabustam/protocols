class Sequence 
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :protocol, inverse_of: :sequences
  

  field :name, type: String
end
