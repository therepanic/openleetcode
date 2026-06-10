def range_bitwise_and(left, right)
  shift = 0
  while left < right
    left >>= 1
    right >>= 1
    shift += 1
  end
  left << shift
end
