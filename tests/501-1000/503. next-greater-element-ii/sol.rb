# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
  n = nums.length
  (0...n).map do |i|
    (nums[i+1..] + nums[0...i]).find { |x| x > nums[i] } || -1
  end
end
