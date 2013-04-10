class Search
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :keywords, type: String
  
  def noticias
    @noticias ||= find_news
  end
  
  private 
  def find_news
    noticia = Noticia.fulltext_search(keywords)
    noticia
  end
end
