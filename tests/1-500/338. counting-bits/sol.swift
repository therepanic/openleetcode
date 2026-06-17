class Solution {
    func countBits(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        var dp = Array(repeating: 0, count: n + 1)
        var sub = 1
        for i in 1...n {
            if sub * 2 == i {
                sub = i
            }
            dp[i] = dp[i - sub] + 1
        }
        return dp
    }
}
