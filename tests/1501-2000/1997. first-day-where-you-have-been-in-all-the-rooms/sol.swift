class Solution {
    func firstDayBeenInAllRooms(_ nextVisit: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = nextVisit.count
        var dp = [Int](repeating: 0, count: n)

        for i in 1..<n {
            dp[i] = (2 * dp[i-1] - dp[nextVisit[i-1]] + 2 + MOD) % MOD
        }
        
        return dp[n-1]
    }
}
