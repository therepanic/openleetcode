class Solution {
    func getMoneyAmount(_ n: Int) -> Int {
        if n <= 1 { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        for length in 2...n {
            for start in stride(from: n - length + 1, through: 1, by: -1) {
                let end = start + length - 1
                dp[start][end] = Int.max
                for pivot in start...end {
                    let left = pivot > start ? dp[start][pivot - 1] : 0
                    let right = pivot < end ? dp[pivot + 1][end] : 0
                    dp[start][end] = min(dp[start][end], pivot + max(left, right))
                }
            }
        }
        return dp[1][n]
    }
}
