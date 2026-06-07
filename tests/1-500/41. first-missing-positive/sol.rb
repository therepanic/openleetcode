def first_missing_positive(nums)
  seen = {}
  nums.each { |num| seen[num] = true }
  i = 1
  i += 1 while seen.key?(i)
  i
end
