module ApplicationHelper
   def display_date(input_date)
    if !input_date
      return ''
    end

    return input_date.strftime("%d/%m/%Y")
  end

  def slice_string(str, size = 100)
    return str.slice(0..size)+"..." unless str.size < size
    return str
  end
end
