def trap(height)
  left = 0
  right = height.length - 1
  left_max = 0
  right_max = 0
  total = 0

  while left < right
    left_max = [left_max, height[left]].max
    right_max = [right_max, height[right]].max

    if left_max < right_max
      total += left_max - height[left]
      left += 1
    else
      total += right_max - height[right]
      right -= 1
    end
  end

  total
end
