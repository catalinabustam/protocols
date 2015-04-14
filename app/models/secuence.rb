class Secuence 
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :protocol
end
