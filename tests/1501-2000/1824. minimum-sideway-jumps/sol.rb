# @param {Integer[]} obstacles
# @return {Integer}
def min_side_jumps(obstacles)
    inf = 1.0/0.0
    dp = [1, 0, 1]
    (1...obstacles.length).each do |i|
        obs = obstacles[i]
        (0...3).each do |j|
            dp[j] = inf if obs == j + 1
        end
        (0...3).each do |j|
            if obs != j + 1
                dp[j] = [dp[j], [dp[(j + 1) % 3], dp[(j + 2) % 3]].min + 1].min
            end
        end
    end
    dp.min
end
