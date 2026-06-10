
def minimum_total(triangle)
  dp = triangle[-1].dup
  (triangle.length - 2).downto(0) do |row|
    (0...triangle[row].length).each do |col|
      dp[col] = triangle[row][col] + [dp[col], dp[col + 1]].min
    end
  end
  dp[0]
end
