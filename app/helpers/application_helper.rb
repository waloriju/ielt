module ApplicationHelper
  require 'digest/md5'

  def display_date(input_date)
    if !input_date
      return ''
    end

    return input_date.strftime("%d/%m/%Y")
  end

  def gravatar(email, size=30)
    email_address = email.downcase  
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"

    image_src
  end
  
  def slice_string(str, size = 100)
    return str.slice(0..size)+"..." unless str.size < size
    return str
  end
end
