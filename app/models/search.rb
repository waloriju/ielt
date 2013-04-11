class Search
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :keywords, type: String
  
  def noticias
    @noticias ||= find_noticias
  end
  
  def devocionais
     @devocionais ||= find_devocionais
  end
  
  private 
  def find_noticias
    noticia = Noticia.fulltext_search(keywords, { :return_scores => true })
    noticia
  end
  
  def find_devocionais
    devocionais = Devocional.fulltext_search(keywords, { :return_scores => true })
    devocionais
  end
end
