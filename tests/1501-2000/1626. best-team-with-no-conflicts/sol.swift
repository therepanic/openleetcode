class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let n = scores.count
        var players = Array(zip(ages, scores)).sorted { $0.0 != $1.0 ? $0.0 < $1.0 : $0.1 < $1.1 }
        var dp = players.map { $0.1 }
        for i in 0..<n {
            for j in 0..<i {
                if players[j].1 <= players[i].1 {
                    dp[i] = max(dp[i], dp[j] + players[i].1)
                }
            }
        }
        return dp.max() ?? 0
    }
}
