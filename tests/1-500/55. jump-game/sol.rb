def can_jump(nums)
  farthest = 0
  nums.each_with_index do |n, i|
    return false if i > farthest

    farthest = [farthest, i + n].max
    return true if farthest >= nums.length - 1
  end
  true
end
