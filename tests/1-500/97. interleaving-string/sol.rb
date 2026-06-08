def is_interleave(s1, s2, s3)
  m = s1.length
  n = s2.length
  return false if m + n != s3.length

  dp = Array.new(n + 1, false)
  dp[0] = true

  (1..n).each do |j|
    dp[j] = dp[j - 1] && s2[j - 1] == s3[j - 1]
  end

  (1..m).each do |i|
    dp[0] = dp[0] && s1[i - 1] == s3[i - 1]
    (1..n).each do |j|
      dp[j] = (dp[j] && s1[i - 1] == s3[i + j - 1]) ||
              (dp[j - 1] && s2[j - 1] == s3[i + j - 1])
    end
  end

  dp[n]
end
