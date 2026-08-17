# @param {Integer[]} scores
# @param {Integer[]} ages
# @return {Integer}
def best_team_score(scores, ages)
    players = ages.zip(scores).sort
    dp = players.map(&:last)
    (0...players.length).each do |i|
        (0...i).each do |j|
            if players[j][1] <= players[i][1]
                dp[i] = [dp[i], dp[j] + players[i][1]].max
            end
        end
    end
    dp.max
end
