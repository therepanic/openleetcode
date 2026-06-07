def two_sum(nums, target)
  seen = {}
  nums.each_with_index do |num, i|
    need = target - num
    if seen.key?(need)
      return [seen[need], i]
    end
    seen[num] = i
  end
  []
end
