class Boletim
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :boletim, BoletimUploader
  
  field :descricao, type: String
  
  validates :descricao, presence: true
end
