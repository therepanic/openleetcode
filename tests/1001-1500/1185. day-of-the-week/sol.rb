# @param {Integer} day
# @param {Integer} month
# @param {Integer} year
# @return {String}
def day_of_the_week(day, month, year)
    days = {
        1 => "Friday",
        2 => "Saturday",
        3 => "Sunday",
        4 => "Monday",
        5 => "Tuesday",
        6 => "Wednesday",
        0 => "Thursday",
    }

    leap_years = (1960...2100).step(4).to_set
    years_days = (1960..2100).map { |i| [i, leap_years.include?(i) ? 366 : 365] }.to_h
    months_days = {
        1 => 31,
        2 => leap_years.include?(year) ? 29 : 28,
        3 => 31,
        4 => 30,
        5 => 31,
        6 => 30,
        7 => 31,
        8 => 31,
        9 => 30,
        10 => 31,
        11 => 30,
        12 => 31
    }

    result_days = 0
    (1971...year).each { |y| result_days += years_days[y] }
    (1...month).each { |m| result_days += months_days[m] }
    result_days += day

    days[result_days % 7]
end
