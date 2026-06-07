def four_sum(nums, target)
  nums.sort!
  res = []
  n = nums.length
  (0...n - 3).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]
    (i + 1...n - 2).each do |j|
      next if j > i + 1 && nums[j] == nums[j - 1]
      l = j + 1
      r = n - 1
      while l < r
        total = nums[i] + nums[j] + nums[l] + nums[r]
        if total == target
          res << [nums[i], nums[j], nums[l], nums[r]]
          l += 1
          r -= 1
          l += 1 while l < r && nums[l] == nums[l - 1]
          r -= 1 while l < r && nums[r] == nums[r + 1]
        elsif total < target
          l += 1
        else
          r -= 1
        end
      end
    end
  end
  res
end
