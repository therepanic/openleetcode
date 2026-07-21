# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
    m = grid.length
    n = grid[0].length
    dp = Array.new(m) { Array.new(n) { Array.new(n, -1) } }
    dp[0][0][n-1] = grid[0][0] + grid[0][n-1]

    (1...m).each do |i|
        (0...n).each do |j|
            (j+1...n).each do |k|
                (-1..1).each do |x|
                    (-1..1).each do |y|
                        if j+x >= 0 && j+x < n && k+y >= 0 && k+y < n
                            prev = dp[i-1][j+x][k+y]
                            if prev != -1
                                add = grid[i][j]
                                add += grid[i][k] if j != k
                                dp[i][j][k] = [dp[i][j][k], prev + add].max
                            end
                        end
                    end
                end
            end
        end
    end

    ans = dp[m-1].flatten.max
    ans != -1 ? ans : 0
end
