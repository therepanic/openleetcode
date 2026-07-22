# @param {Integer} n
# @param {Integer[][]} reserved_seats
# @return {Integer}
def max_number_of_families(n, reserved_seats)
  row_seats = Hash.new { |hash, key| hash[key] = Set.new }
  
  reserved_seats.each do |row, seat|
    row_seats[row].add(seat)
  end
  
  ans = (n - row_seats.size) * 2
  
  option1 = Set.new([2, 3, 4, 5])
  option2 = Set.new([6, 7, 8, 9])
  option3 = Set.new([4, 5, 6, 7])
  
  row_seats.each_value do |seats|
    available = 0
    if (option1 & seats).empty?
      available += 1
    end
    if (option2 & seats).empty?
      available += 1
    end
    if (option3 & seats).empty?
      available = [available, 1].max
    end
    ans += available
  end
  
  ans
end
