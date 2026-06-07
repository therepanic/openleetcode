def unique_paths_with_obstacles(obstacle_grid)
  rows = obstacle_grid.length
  cols = obstacle_grid[0].length
  dp = Array.new(cols, 0)
  dp[0] = obstacle_grid[0][0] == 0 ? 1 : 0

  rows.times do |row|
    cols.times do |col|
      if obstacle_grid[row][col] == 1
        dp[col] = 0
      elsif col > 0
        dp[col] += dp[col - 1]
      end
    end
  end

  dp[-1]
end
