# @param {String} n
# @return {String}
def smallest_good_base(n)
  num = n.to_i
  max_m = num.bit_length - 1
  max_m.downto(1) do |m|
    left = 2
    right = (num ** (1.0 / m)).to_i + 1
    while left <= right
      mid = left + (right - left) / 2
      cmp = compare_base(mid, m, num)
      return mid.to_s if cmp == 0
      if cmp < 0
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end
  (num - 1).to_s
end

def compare_base(base, m, num)
  sum = 1
  cur = 1
  m.times do
    cur *= base
    sum += cur
    return 1 if sum > num
  end
  return 0 if sum == num
  -1
end
