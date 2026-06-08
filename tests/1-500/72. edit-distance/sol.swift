class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a = Array(word1)
        let b = Array(word2)
        var dp = Array(0...b.count)

        if !a.isEmpty {
            for i in 1...a.count {
                var prev = dp[0]
                dp[0] = i
                if !b.isEmpty {
                    for j in 1...b.count {
                        let temp = dp[j]
                        if a[i - 1] == b[j - 1] {
                            dp[j] = prev
                        } else {
                            dp[j] = 1 + min(prev, min(dp[j], dp[j - 1]))
                        }
                        prev = temp
                    }
                }
            }
        }

        return dp[b.count]
    }
}
