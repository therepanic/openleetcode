class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let m = strs[0].count
        var dp = Array(repeating: 1, count: m)
        let rows = strs.map { Array($0) }
        
        for i in 0..<m {
            for j in 0..<i {
                var all = true
                for row in rows {
                    if row[j] > row[i] {
                        all = false
                        break
                    }
                }
                if all {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return m - dp.max()!
    }
}
