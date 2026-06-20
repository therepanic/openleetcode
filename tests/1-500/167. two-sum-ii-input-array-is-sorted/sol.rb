def two_sum(numbers, target)
  left = 0
  right = numbers.length - 1
  while left < right
    total = numbers[left] + numbers[right]
    return [left + 1, right + 1] if total == target
    if total < target
      left += 1
    else
      right -= 1
    end
  end
  []
end
