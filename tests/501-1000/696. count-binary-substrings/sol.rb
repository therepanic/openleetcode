# @param {String} s
# @return {Integer}
def count_binary_substrings(s)
  ans, prev, cur = 0, 0, 1
  (1...s.length).each do |i|
    if s[i-1] != s[i]
      ans += [prev, cur].min
      prev, cur = cur, 1
    else
      cur += 1
    end
  end
  ans + [prev, cur].min
end
