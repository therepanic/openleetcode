# @param {String} date
# @return {Integer}
def day_of_year(date)
    val = {1 => 0, 2 => 31, 3 => 59, 4 => 90, 5 => 120, 6 => 151, 7 => 181, 8 => 212, 9 => 243, 10 => 273, 11 => 304, 12 => 334}
    d = date[8..9].to_i
    m = date[5..6].to_i
    y = date[0..3].to_i
    is_leap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0)
    if is_leap
        (3..12).each { |i| val[i] += 1 }
    end
    return d + val[m]
end
