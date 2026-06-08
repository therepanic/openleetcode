def max_area(height)
  left = 0
  right = height.length - 1
  ans = 0
  while left < right
    ans = [ans, [height[left], height[right]].min * (right - left)].max
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  ans
end
