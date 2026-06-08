def num_trees(n)
  dp = Array.new(n + 1, 0)
  dp[0] = 1
  dp[1] = 1

  (2..n).each do |nodes|
    (1..nodes).each do |root|
      dp[nodes] += dp[root - 1] * dp[nodes - root]
    end
  end

  dp[n]
end
