# @param {Integer[]} nums
# @return {Integer}
def delete_and_earn(nums)
  count = Hash.new(0)
  nums.each { |n| count[n] += 1 }
  unique_nums = count.keys.sort
  prev = nil
  take = 0
  skip = 0

  unique_nums.each do |num|
    max_points = [skip, take].max
    if prev == num - 1
      take = num * count[num] + skip
      skip = max_points
    else
      take = num * count[num] + max_points
      skip = max_points
    end
    prev = num
  end

  [take, skip].max
end
