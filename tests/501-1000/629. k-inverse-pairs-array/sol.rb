# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def k_inverse_pairs(n, k)
  mod = 10**9 + 7
  dp = Array.new(n + 1) { Array.new(k + 1, 0) }

  (1..n).each do |i|
    (0..k).each do |j|
      if j == 0
        dp[i][j] = 1
      else
        val = dp[i - 1][j]
        val -= dp[i - 1][j - i] if j - i >= 0
        val = (val + mod) % mod
        dp[i][j] = (dp[i][j - 1] + val) % mod
      end
    end
  end

  result = dp[n][k]
  result -= dp[n][k - 1] if k > 0
  (result + mod) % mod
end
