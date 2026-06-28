def knight_probability(n, k, row, column)
  return 1.0 if k == 0

  moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  
  dp = Array.new(n) { Array.new(n, 0.0) }
  dp[row][column] = 1.0
  
  k.times do
    next_dp = Array.new(n) { Array.new(n, 0.0) }
    (0...n).each do |r|
      (0...n).each do |c|
        next if dp[r][c] == 0
        moves.each do |dr, dc|
          nr = r + dr
          nc = c + dc
          if nr >= 0 && nr < n && nc >= 0 && nc < n
            next_dp[nr][nc] += dp[r][c] / 8.0
          end
        end
      end
    end
    dp = next_dp
  end
  
  dp.flatten.sum
end
