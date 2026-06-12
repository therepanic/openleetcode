def max_product(nums)
  best = nums[0]
  cur_max = nums[0]
  cur_min = nums[0]
  nums[1..].each do |x|
    cur_max, cur_min = cur_min, cur_max if x < 0
    cur_max = [x, cur_max * x].max
    cur_min = [x, cur_min * x].min
    best = [best, cur_max].max
  end
  best
end
