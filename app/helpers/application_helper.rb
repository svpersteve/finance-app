module ApplicationHelper
  def red_or_green(number)
    (number < 0) ? 'red' : 'green'
  end
end
