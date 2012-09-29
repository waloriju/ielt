class Pagina
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :titulo, type: String
  field :conteudo, type: String
  
  validates :titulo, :conteudo, presence: true
end
