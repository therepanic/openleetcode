# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
    row = matrix.length
    col = matrix[0].length
    dp = Array.new(row) { Array.new(col, 0) }
    
    graph = lambda do |i, j|
        return dp[i][j] if dp[i][j] != 0
        
        top = 0
        down = 0
        left = 0
        right = 0
        
        if i - 1 >= 0 && matrix[i-1][j] > matrix[i][j]
            dp[i-1][j] = graph.call(i-1, j) if dp[i-1][j] == 0
            top = dp[i-1][j]
        end
        
        if i + 1 < row && matrix[i+1][j] > matrix[i][j]
            dp[i+1][j] = graph.call(i+1, j) if dp[i+1][j] == 0
            down = dp[i+1][j]
        end
        
        if j - 1 >= 0 && matrix[i][j-1] > matrix[i][j]
            dp[i][j-1] = graph.call(i, j-1) if dp[i][j-1] == 0
            left = dp[i][j-1]
        end
        
        if j + 1 < col && matrix[i][j+1] > matrix[i][j]
            dp[i][j+1] = graph.call(i, j+1) if dp[i][j+1] == 0
            right = dp[i][j+1]
        end
        
        dp[i][j] = 1 + [top, down, left, right].max
        return dp[i][j]
    end
    
    maxi = 0
    (0...row).each do |i|
        (0...col).each do |j|
            num = graph.call(i, j)
            maxi = [maxi, num].max
        end
    end
    
    maxi
end
