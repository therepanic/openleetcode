def longest_consecutive(nums)
  seen = nums.to_set
  best = 0
  seen.each do |num|
    next if seen.include?(num - 1)
    current = num
    streak = 1
    while seen.include?(current + 1)
      current += 1
      streak += 1
    end
    best = [best, streak].max
  end
  best
end
