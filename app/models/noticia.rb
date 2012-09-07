class Noticia
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch
  
  field :titulo, type: String
  field :conteudo, type: String
  
  belongs_to :usuario
  
  fulltext_search_in :conteudo, :index_name => 'fts_noticia.conteudo'
end
