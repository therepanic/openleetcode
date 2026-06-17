# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
    balloons = [1] + nums + [1]
    n = balloons.length
    dp = Array.new(n) { Array.new(n, 0) }
    
    (2...n).each do |length|
        (0...n-length).each do |left|
            right = left + length
            best = 0
            (left+1...right).each do |k|
                gain = balloons[left] * balloons[k] * balloons[right]
                total = gain + dp[left][k] + dp[k][right]
                best = total if total > best
            end
            dp[left][right] = best
        end
    end
    
    dp[0][n-1]
end
