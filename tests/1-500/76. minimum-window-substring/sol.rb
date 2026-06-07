def min_window(s, t)
  return "" if s.empty? || t.empty? || s.length < t.length

  need = Hash.new(0)
  t.each_char { |ch| need[ch] += 1 }

  missing = t.length
  left = 0
  best_l = 0
  best_len = Float::INFINITY

  right = 0
  while right < s.length
    ch = s[right]
    if need.key?(ch)
      missing -= 1 if need[ch] > 0
      need[ch] -= 1
    end

    while missing == 0
      curr_len = right - left + 1
      if curr_len < best_len
        best_len = curr_len
        best_l = left
      end
      d = s[left]
      left += 1
      if need.key?(d)
        need[d] += 1
        missing += 1 if need[d] > 0
      end
    end

    right += 1
  end

  best_len.finite? ? s[best_l, best_len] : ""
end
