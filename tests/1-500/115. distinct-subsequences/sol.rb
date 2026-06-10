
def num_distinct(s, t)
  return 0 if t.length > s.length
  dp = Array.new(t.length + 1, 0)
  dp[0] = 1
  s.each_char do |ch|
    (t.length - 1).downto(0) do |j|
      dp[j + 1] += dp[j] if ch == t[j]
    end
  end
  dp[t.length]
end
