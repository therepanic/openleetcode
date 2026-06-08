def my_sqrt(x)
  return x if x < 2

  left = 1
  right = x / 2
  ans = 1

  while left <= right
    mid = left + (right - left) / 2
    square = mid * mid
    return mid if square == x
    if square < x
      ans = mid
      left = mid + 1
    else
      right = mid - 1
    end
  end

  ans
end
