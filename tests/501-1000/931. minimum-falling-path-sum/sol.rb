# @param {Integer[][]} matrix
# @return {Integer}
def min_falling_path_sum(matrix)
    m = matrix.length
    n = matrix[0].length
    if m == 1 && n == 1
        return matrix[0].min
    end
    dp = Array.new(m - 1) { Array.new(n) }
    mini = Float::INFINITY
    f = lambda do |i, j|
        if j >= n || j < 0
            return Float::INFINITY
        end
        if i == m - 1
            return matrix[i][j]
        end
        if dp[i][j] != nil
            return dp[i][j]
        end
        down = matrix[i][j] + f.call(i + 1, j)
        leftd = matrix[i][j] + f.call(i + 1, j - 1)
        rightd = matrix[i][j] + f.call(i + 1, j + 1)
        dp[i][j] = [down, leftd, rightd].min
        return dp[i][j]
    end
    (0...n).each do |i|
        mini = [mini, f.call(0, i)].min
    end
    return mini
end
