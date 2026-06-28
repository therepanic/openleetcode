# @param {String} s
# @return {Integer}
def num_decodings(s)
  d = Hash.new(0)
  (1..26).each { |i| d[i.to_s] = 1 }
  (0..9).each { |i| d["*#{i}"] = 1 + (i < 7 ? 1 : 0) }
  d['*'] = 9
  d['**'] = 15
  d['1*'] = 9
  d['2*'] = 6

  n = s.length - 1
  m = 10**9 + 7
  dp = Array.new(n + 2, 0)
  dp[0] = d[s[0]]
  dp[n + 1] = 1

  (0...n).each do |i|
    one = s[i + 1]
    two = s[i] + s[i + 1]
    dp[i + 1] = (d[one] * dp[i] + d[two] * (i > 0 ? dp[i - 1] : 1)) % m
    return 0 if dp[i + 1] == 0
  end

  dp[n]
end
