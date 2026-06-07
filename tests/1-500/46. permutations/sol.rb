def permute(nums)
  res = []

  backtrack = nil
  backtrack = lambda do |i|
    if i == nums.length
      res << nums.dup
      return
    end

    (i...nums.length).each do |j|
      nums[i], nums[j] = nums[j], nums[i]
      backtrack.call(i + 1)
      nums[i], nums[j] = nums[j], nums[i]
    end
  end

  backtrack.call(0)
  res
end
