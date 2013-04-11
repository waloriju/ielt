class Devocional
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch
  include Mongoid::Slug
  
  field :titulo, type: String
  field :conteudo, type: String
  field :data_devocional, type: Date, default: Time.now
  
  validates :titulo, presence: true
  validates :conteudo, :data_devocional, presence: true
  
  belongs_to :usuario
  
  fulltext_search_in :conteudo, :index_name => 'fts_devocional.conteudo'
end
