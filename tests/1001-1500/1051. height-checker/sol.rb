# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
  count = 0
  s = heights.sort
  heights.zip(s).each do |i, j|
    count += 1 if i != j
  end
  count
end
