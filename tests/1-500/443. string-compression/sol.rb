def compress(chars)
  i = 0
  j = 0
  while j < chars.length
    c = chars[j]
    count = 0
    while j < chars.length && chars[j] == c
      j += 1
      count += 1
    end
    chars[i] = c
    i += 1
    if count > 1
      count.to_s.each_char do |ch|
        chars[i] = ch
        i += 1
      end
    end
  end
  i
end
