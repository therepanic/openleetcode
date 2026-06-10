def single_number(nums)
  nums.reduce(0) { |acc, num| acc ^ num }
end
