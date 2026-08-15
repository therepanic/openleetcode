# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
    m = points.length
    n = points[0].length
    
    dp = points[0].dup
    
    (1...m).each do |r|
        left = Array.new(n, 0)
        right = Array.new(n, 0)
        
        left[0] = dp[0]
        (1...n).each do |c|
            left[c] = [left[c-1], dp[c] + c].max
        end
        
        right[n-1] = dp[n-1] - (n-1)
        (n-2).downto(0) do |c|
            right[c] = [right[c+1], dp[c] - c].max
        end
        
        new_dp = Array.new(n, 0)
        (0...n).each do |c|
            best = [left[c] - c, right[c] + c].max
            new_dp[c] = points[r][c] + best
        end
        dp = new_dp
    end
    
    dp.max
end
