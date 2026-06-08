def three_sum_closest(nums, target)
  nums.sort!
  best = nums[0] + nums[1] + nums[2]
  (0...nums.length - 2).each do |i|
    l = i + 1
    r = nums.length - 1
    while l < r
      total = nums[i] + nums[l] + nums[r]
      best = total if (target - total).abs < (target - best).abs
      return target if total == target
      if total < target
        l += 1
      else
        r -= 1
      end
    end
  end
  best
end
