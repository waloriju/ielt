class Usuario
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  
  has_secure_password
  
  #Fields
  field :nome, type: String
  field :email, type: String
  field :admin, type: Boolean
  field :password_digest, type: String #for bcrypt-ruby
end
