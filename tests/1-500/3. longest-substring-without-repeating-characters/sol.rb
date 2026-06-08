def length_of_longest_substring(s)
  last_seen = {}
  start = 0
  res = 0
  s.each_char.with_index do |char, end_idx|
    if last_seen.key?(char) && last_seen[char] >= start
      start = last_seen[char] + 1
    end
    res = [res, end_idx - start + 1].max
    last_seen[char] = end_idx
  end
  res
end
