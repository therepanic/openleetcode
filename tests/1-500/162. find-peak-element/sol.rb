def find_peak_element(nums)
  n = nums.length
  return nums[0] >= nums[n - 1] ? 0 : n - 1 if n < 3

  left = 0
  right = nums.length - 1
  while left < right
    mid = left + (right - left) / 2
    return mid if mid > 0 && mid < n - 1 && nums[mid - 1] < nums[mid] && nums[mid] > nums[mid + 1]
    if nums[mid] < nums[mid + 1]
      left = mid + 1
    else
      right = mid
    end
  end
  left
end
