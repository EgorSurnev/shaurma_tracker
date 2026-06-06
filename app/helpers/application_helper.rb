module ApplicationHelper
  def russian_time_ago(time)
    return unless time
    
    diff = (Time.current - time).to_i
    minutes = diff / 60
    hours = minutes / 60
    days = hours / 24
    weeks = days / 7
    months = days / 30
    years = days / 365
    
    case
    when diff < 60
      "только что"
    when minutes < 60
      "#{minutes} #{russian_minutes(minutes)} назад"
    when hours < 24
      "#{hours} #{russian_hours(hours)} назад"
    when days < 7
      "#{days} #{russian_days(days)} назад"
    when weeks < 4
      "#{weeks} #{russian_weeks(weeks)} назад"
    when months < 12
      "#{months} #{russian_months(months)} назад"
    else
      "#{years} #{russian_years(years)} назад"
    end
  end
  
  private
  
  def russian_minutes(n)
    if n % 10 == 1 && n % 100 != 11
      "минуту"
    elsif (2..4).include?(n % 10) && !(12..14).include?(n % 100)
      "минуты"
    else
      "минут"
    end
  end
  
  def russian_hours(n)
    if n % 10 == 1 && n % 100 != 11
      "час"
    elsif (2..4).include?(n % 10) && !(12..14).include?(n % 100)
      "часа"
    else
      "часов"
    end
  end
  
  def russian_days(n)
    if n % 10 == 1 && n % 100 != 11
      "день"
    elsif (2..4).include?(n % 10) && !(12..14).include?(n % 100)
      "дня"
    else
      "дней"
    end
  end
  
  def russian_weeks(n)
    if n % 10 == 1 && n % 100 != 11
      "неделю"
    elsif (2..4).include?(n % 10) && !(12..14).include?(n % 100)
      "недели"
    else
      "недель"
    end
  end
  
  def russian_months(n)
    if n % 10 == 1 && n % 100 != 11
      "месяц"
    elsif (2..4).include?(n % 10) && !(12..14).include?(n % 100)
      "месяца"
    else
      "месяцев"
    end
  end
  
  def russian_years(n)
    if n % 10 == 1 && n % 100 != 11
      "год"
    elsif (2..4).include?(n % 10) && !(12..14).include?(n % 100)
      "года"
    else
      "лет"
    end
  end
end