def jump(nums)
  n = nums.length
  return 0 if n <= 1

  jumps = 0
  curr_end = 0
  max_reach = 0

  (0...(n - 1)).each do |i|
    max_reach = [max_reach, i + nums[i]].max
    if i == curr_end
      jumps += 1
      curr_end = max_reach
      break if curr_end >= n - 1
    end
  end

  jumps
end
