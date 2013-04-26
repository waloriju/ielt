module GravatarHelper
  require 'digest/md5'

  def gravatar(email, size=30)
    email_address = email.downcase  
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"

    image_src
  end
end