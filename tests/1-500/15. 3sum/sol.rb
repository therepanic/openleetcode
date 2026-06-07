def three_sum(nums)
  nums.sort!
  res = []
  n = nums.length
  (0...n - 2).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]
    l = i + 1
    r = n - 1
    while l < r
      total = nums[i] + nums[l] + nums[r]
      if total == 0
        res << [nums[i], nums[l], nums[r]]
        l += 1
        r -= 1
        l += 1 while l < r && nums[l] == nums[l - 1]
        r -= 1 while l < r && nums[r] == nums[r + 1]
      elsif total < 0
        l += 1
      else
        r -= 1
      end
    end
  end
  res
end
