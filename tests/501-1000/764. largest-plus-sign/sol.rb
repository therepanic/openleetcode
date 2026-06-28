# @param {Integer} n
# @param {Integer[][]} mines
# @return {Integer}
def order_of_largest_plus_sign(n, mines)
    s = Set.new(mines)
    dp = Array.new(n) { Array.new(n, n) }
    
    (0...n).each do |i|
        count = 0
        (0...n).each do |j|
            count = s.include?([i, j]) ? 0 : count + 1
            dp[i][j] = [dp[i][j], count].min
        end
        count = 0
        (n - 1).downto(0).each do |j|
            count = s.include?([i, j]) ? 0 : count + 1
            dp[i][j] = [dp[i][j], count].min
        end
    end
    
    (0...n).each do |j|
        count = 0
        (0...n).each do |i|
            count = s.include?([i, j]) ? 0 : count + 1
            dp[i][j] = [dp[i][j], count].min
        end
        count = 0
        (n - 1).downto(0).each do |i|
            count = s.include?([i, j]) ? 0 : count + 1
            dp[i][j] = [dp[i][j], count].min
        end
    end
    
    dp.map(&:max).max
end
