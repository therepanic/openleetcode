def maximum_gap(nums)
  return 0 if nums.length < 2
  nums = nums.sort
  best = 0
  (1...nums.length).each do |i|
    best = [best, nums[i] - nums[i - 1]].max
  end
  best
end
