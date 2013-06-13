class Contato
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :nome, type: String
  field :email, type: String
  field :telefone, type: String
  field :mensagem, type: String
  
  validates :nome, :email, :telefone, presence: true
end
