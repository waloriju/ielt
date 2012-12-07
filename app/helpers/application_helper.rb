module ApplicationHelper
  def display_date(input_date)
      if !input_date
        return ''
      end

      return input_date.strftime("%d/%m/%Y")
    end
end
