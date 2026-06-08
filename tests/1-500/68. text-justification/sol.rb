def full_justify(words, max_width)
  res = []
  i = 0
  n = words.length

  while i < n
    j = i
    line_len = 0
    while j < n && line_len + words[j].length + (j - i) <= max_width
      line_len += words[j].length
      j += 1
    end

    spaces = max_width - line_len
    gaps = j - i - 1
    line = +''

    if j == n || gaps == 0
      (i...j).each do |k|
        line << ' ' if k > i
        line << words[k]
      end
      line << (' ' * (max_width - line.length))
    else
      each = spaces / gaps
      extra = spaces % gaps
      (i...j).each do |k|
        line << words[k]
        next if k == j - 1
        count = each + (extra > 0 ? 1 : 0)
        line << (' ' * count)
        extra -= 1 if extra > 0
      end
    end

    res << line
    i = j
  end

  res
end
