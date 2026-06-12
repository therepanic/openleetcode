def rob(nums)
  next1 = 0
  next2 = 0
  (nums.length - 1).downto(0) do |i|
    curr = [nums[i] + next2, next1].max
    next2 = next1
    next1 = curr
  end
  next1
end
