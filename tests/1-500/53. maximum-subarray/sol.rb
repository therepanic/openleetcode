def max_sub_array(nums)
  best = nums[0]
  cur = 0
  nums.each do |n|
    cur = 0 if cur < 0
    cur += n
    best = cur if cur > best
  end
  best
end
