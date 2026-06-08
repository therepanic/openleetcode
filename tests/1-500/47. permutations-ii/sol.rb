def permute_unique(nums)
  nums.sort!
  used = Array.new(nums.length, false)
  path = []
  res = []

  backtrack = nil
  backtrack = lambda do
    if path.length == nums.length
      res << path.dup
      return
    end

    (0...nums.length).each do |i|
      next if used[i]
      next if i > 0 && nums[i] == nums[i - 1] && !used[i - 1]
      used[i] = true
      path << nums[i]
      backtrack.call
      path.pop
      used[i] = false
    end
  end

  backtrack.call
  res
end
