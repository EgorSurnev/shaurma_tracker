module ApplicationHelper
  def russian_pluralize(count, one, few, many)
    remainder = count % 10
    remainder_100 = count % 100
      
      if remainder == 1 && remainder_100 != 11
        "#{count} #{one}"
      elsif (2..4).include?(remainder) && !(12..14).include?(remainder_100)
        "#{count} #{few}"
      else
        "#{count} #{many}"
      end
  end
end
