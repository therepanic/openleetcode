# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
    n = grid.length
    
    dp = Array.new(n) { Array.new(n, -Float::INFINITY) }
    dp[0][0] = 0
    
    (0..2*(n-1)).each do |k|
        new_dp = Array.new(n) { Array.new(n, -Float::INFINITY) }
        
        (0...n).each do |x1|
            y1 = k - x1
            next unless y1 >= 0 && y1 < n
            
            (0...n).each do |x2|
                y2 = k - x2
                next unless y2 >= 0 && y2 < n
                
                next if grid[x1][y1] == -1 || grid[x2][y2] == -1
                
                val = dp[x1][x2]
                val = [val, dp[x1-1][x2]].max if x1 > 0
                val = [val, dp[x1][x2-1]].max if x2 > 0
                val = [val, dp[x1-1][x2-1]].max if x1 > 0 && x2 > 0
                
                val += grid[x1][y1]
                val += grid[x2][y2] if x1 != x2
                
                new_dp[x1][x2] = val
            end
        end
        
        dp = new_dp
    end
    
    [0, dp[n-1][n-1]].max
end
