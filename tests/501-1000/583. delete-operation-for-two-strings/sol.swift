class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count, m = word2.count
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        let arr1 = Array(word1), arr2 = Array(word2)

        for i in 1...n {
            for j in 1...m {
                if arr1[i-1] == arr2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return n + m - 2 * dp[n][m]
    }
}
