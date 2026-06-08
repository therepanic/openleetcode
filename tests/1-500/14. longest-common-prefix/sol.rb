def longest_common_prefix(strs)
  return '' if strs.empty?
  strs.sort!
  ans = ''
  i = 0
  while i < strs[0].length && strs[0][i] == strs[-1][i]
    ans << strs[0][i]
    i += 1
  end
  ans
end
