def single_number(nums)
  ((3 * nums.to_set.sum) - nums.sum) >> 1
end
