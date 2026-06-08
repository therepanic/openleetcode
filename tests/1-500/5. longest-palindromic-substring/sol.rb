def longest_palindrome(s)
  return "" if s.empty?

  expand = lambda do |left, right|
    while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
    end
    right - left - 1
  end

  start = 0
  best = 1

  0.upto(s.length - 1) do |i|
    length = [expand.call(i, i), expand.call(i, i + 1)].max
    if length > best
      best = length
      start = i - (length - 1) / 2
    end
  end

  s[start, best]
end
