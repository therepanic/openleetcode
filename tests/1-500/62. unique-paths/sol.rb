def unique_paths(m, n)
  dp = Array.new(n, 1)
  (m - 1).times do
    (1...n).each do |col|
      dp[col] += dp[col - 1]
    end
  end
  dp[-1]
end
