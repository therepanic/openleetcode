# @param {String} s
# @return {Integer}
def unique_letter_string(s)
  n = s.length
  left = Array.new(n, 0)
  right = Array.new(n, 0)
  prev = Array.new(26, -1)

  (0...n).each do |i|
    idx = s[i].ord - 'A'.ord
    left[i] = prev[idx]
    prev[idx] = i
  end

  prev = Array.new(26, n)

  (n - 1).downto(0) do |i|
    idx = s[i].ord - 'A'.ord
    right[i] = prev[idx]
    prev[idx] = i
  end

  ans = 0
  (0...n).each do |i|
    ans += (i - left[i]) * (right[i] - i)
  end
  ans
end
