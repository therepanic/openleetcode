class Solution {
    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: Array(repeating: 0, count: minProfit + 1), count: n + 1)
        dp[0][0] = 1
        for k in 1...group.count {
            let g = group[k - 1]
            let p = profit[k - 1]
            for i in stride(from: n, through: g, by: -1) {
                for j in stride(from: minProfit, through: 0, by: -1) {
                    let prev = j - p >= 0 ? dp[i - g][j - p] : dp[i - g][0]
                    dp[i][j] = (dp[i][j] + prev) % mod
                }
            }
        }
        var ans = 0
        for i in 0...n {
            ans = (ans + dp[i][minProfit]) % mod
        }
        return ans
    }
}
