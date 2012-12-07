class Evento
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :name, :data_evento, :titulo, :descricao
  
  def start_time
    data_evento
  end
    
  field :data_evento, type: Date
  
  field :titulo, type: String
  field :descricao, type: String
  
  validates :titulo, :descricao, :data_evento, presence: true
end
