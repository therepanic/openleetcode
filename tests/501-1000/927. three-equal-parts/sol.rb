# @param {Integer[]} arr
# @return {Integer[]}
def three_equal_parts(arr)
  n = arr.length
  ones = arr.sum
  return [0, n - 1] if ones == 0
  return [-1, -1] if ones % 3 != 0

  k = ones / 3
  i1 = i2 = i3 = -1
  seen = 0
  arr.each_with_index do |x, i|
    next unless x == 1
    seen += 1
    if seen == 1
      i1 = i
    elsif seen == k + 1
      i2 = i
    elsif seen == 2 * k + 1
      i3 = i
      break
    end
  end

  len = n - i3
  return [-1, -1] if i1 + len > i2 || i2 + len > i3
  (0...len).each do |i|
    return [-1, -1] if arr[i1 + i] != arr[i2 + i] || arr[i1 + i] != arr[i3 + i]
  end
  [i1 + len - 1, i2 + len]
end
