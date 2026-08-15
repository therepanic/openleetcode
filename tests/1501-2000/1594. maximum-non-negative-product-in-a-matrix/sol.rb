# @param {Integer[][]} grid
# @return {Integer}
def max_product_path(grid)
    r, c = grid.length, grid[0].length
    mod = 10**9 + 7
    dp = Array.new(r) { Array.new(c) { [0, 0] } }
    
    p = grid[0][0]
    dp[0][0][0] = dp[0][0][1] = p
    (1...c).each do |j|
        p *= grid[0][j]
        dp[0][j][0] = dp[0][j][1] = p
    end
    
    p = grid[0][0]
    (1...r).each do |i|
        p *= grid[i][0]
        dp[i][0][0] = dp[i][0][1] = p
        (1...c).each do |j|
            x = grid[i][j]
            vals = [x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]]
            dp[i][j][0] = vals.min
            dp[i][j][1] = vals.max
        end
    end
    
    ans = dp[r-1][c-1][1]
    ans < 0 ? -1 : ans % mod
end
