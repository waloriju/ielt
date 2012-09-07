class Usuario
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  
  has_secure_password
  
  #Fields
  field :nome, type: String
  field :email, type: String
  field :admin, type: Boolean
  field :password_digest, type: String 
  
  validates :nome, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, :on => :create
  
  has_many :noticias
end
