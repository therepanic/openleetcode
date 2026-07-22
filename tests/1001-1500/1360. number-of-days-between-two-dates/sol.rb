# @param {String} date1
# @param {String} date2
# @return {Integer}
def days_between_dates(date1, date2)
  require 'date'
  y1, m1, d1 = date1.split('-').map(&:to_i)
  y2, m2, d2 = date2.split('-').map(&:to_i)
  (Date.new(y1, m1, d1) - Date.new(y2, m2, d2)).to_i.abs
end
