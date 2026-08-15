# @param {Integer[]} stones
# @return {Integer}
def stone_game_vii(stones)
    n = stones.length
    prefix = Array.new(n + 1, 0)
    
    (0...n).each do |i|
        prefix[i + 1] = prefix[i] + stones[i]
    end
    
    dp = Array.new(n) { Array.new(n, 0) }

    (2..n).each do |length|
        (0..(n - length)).each do |i|
            j = i + length - 1
            total = prefix[j + 1] - prefix[i]
            dp[i][j] = [
                total - stones[i] - dp[i + 1][j],
                total - stones[j] - dp[i][j - 1]
            ].max
        end
    end

    dp[0][n - 1]
end
