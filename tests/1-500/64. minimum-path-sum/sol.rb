def min_path_sum(grid)
  rows = grid.length
  cols = grid[0].length
  dp = Array.new(cols, 0)
  dp[0] = grid[0][0]

  (1...cols).each do |col|
    dp[col] = dp[col - 1] + grid[0][col]
  end

  (1...rows).each do |row|
    dp[0] += grid[row][0]
    (1...cols).each do |col|
      dp[col] = [dp[col], dp[col - 1]].min + grid[row][col]
    end
  end

  dp[-1]
end
