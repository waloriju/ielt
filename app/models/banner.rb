class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :img, BannerUploader
  
  field :titulo, type: String
  
  validates :titulo, presence: true
end
