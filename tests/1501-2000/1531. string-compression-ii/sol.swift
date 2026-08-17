class Solution {
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let chars = Array(s)
        var dp = Array(repeating: Array(repeating: 9999, count: 110), count: 110)
        dp[0][0] = 0

        for i in 1...n {
            for j in 0...k {
                var cnt = 0
                var del = 0
                for l in stride(from: i, through: 1, by: -1) {
                    if chars[l-1] == chars[i-1] {
                        cnt += 1
                    } else {
                        del += 1
                    }
                    if j - del >= 0 {
                        let add = cnt >= 100 ? 3 : (cnt >= 10 ? 2 : (cnt >= 2 ? 1 : 0))
                        dp[i][j] = min(dp[i][j], dp[l-1][j-del] + 1 + add)
                    }
                }
                if j > 0 {
                    dp[i][j] = min(dp[i][j], dp[i-1][j-1])
                }
            }
        }
        return dp[n][k]
    }
}
