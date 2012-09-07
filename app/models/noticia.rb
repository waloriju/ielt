class Noticia
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch
  include Mongoid::Slug
  
  field :titulo, type: String
  field :conteudo, type: String
  
  slug :titulo
  
  validates :titulo, presence: true
  validates :conteudo, presence: true
  
  belongs_to :usuario
  
  fulltext_search_in :conteudo, :index_name => 'fts_noticia.conteudo'
end
