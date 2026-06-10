def find_min(nums)
  left = 0
  right = nums.length - 1
  while left < right
    mid = left + (right - left) / 2
    if nums[mid] > nums[right]
      left = mid + 1
    elsif nums[mid] < nums[right]
      right = mid
    else
      right -= 1
    end
  end
  nums[left]
end
