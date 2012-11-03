class Educacional
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :titulo, type: String
  field :descricao, type: String
  
  slug :titulo
  
  validates :titulo, presence: true;
end
