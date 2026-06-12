def majority_element(nums)
  candidate = 0
  count = 0
  nums.each do |num|
    candidate = num if count == 0
    count += (num == candidate ? 1 : -1)
  end
  candidate
end
