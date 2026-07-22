class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: 2)
        func dp(_ player: Int, _ stones: Int) -> Bool {
            if stones == 0 { return false }
            if memo[player][stones] != -1 { return memo[player][stones] == 1 }
            let sqrt = Int(Double(stones).squareRoot())
            for i in stride(from: sqrt, through: 1, by: -1) {
                let sq = i * i
                if sq == stones || !dp(player ^ 1, stones - sq) {
                    memo[player][stones] = 1
                    return true
                }
            }
            memo[player][stones] = 0
            return false
        }
        return dp(0, n)
    }
}
