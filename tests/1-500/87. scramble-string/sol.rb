def is_scramble(s1, s2)
  @memo ||= {}
  return true if s1 == s2
  key = s1 + '#' + s2
  return @memo[key] if @memo.key?(key)
  counts = Array.new(26, 0)
  s1.each_byte { |ch| counts[ch - 97] += 1 }
  s2.each_byte { |ch| counts[ch - 97] -= 1 }
  unless counts.all?(&:zero?)
    @memo[key] = false
    return false
  end
  n = s1.length
  (1...n).each do |i|
    if is_scramble(s1[0, i], s2[0, i]) && is_scramble(s1[i, n - i], s2[i, n - i])
      @memo[key] = true
      return true
    end
    if is_scramble(s1[0, i], s2[n - i, i]) && is_scramble(s1[i, n - i], s2[0, n - i])
      @memo[key] = true
      return true
    end
  end
  @memo[key] = false
end
