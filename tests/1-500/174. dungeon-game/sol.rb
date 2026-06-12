def calculate_minimum_hp(dungeon)
  rows = dungeon.length
  cols = dungeon[0].length
  dp = Array.new(rows) { Array.new(cols, 0) }
  dp[rows - 1][cols - 1] = [1, 1 - dungeon[rows - 1][cols - 1]].max
  (rows - 2).downto(0) { |r| dp[r][cols - 1] = [1, dp[r + 1][cols - 1] - dungeon[r][cols - 1]].max }
  (cols - 2).downto(0) { |c| dp[rows - 1][c] = [1, dp[rows - 1][c + 1] - dungeon[rows - 1][c]].max }
  (rows - 2).downto(0) do |r|
    (cols - 2).downto(0) do |c|
      dp[r][c] = [1, [dp[r + 1][c], dp[r][c + 1]].min - dungeon[r][c]].max
    end
  end
  dp[0][0]
end
