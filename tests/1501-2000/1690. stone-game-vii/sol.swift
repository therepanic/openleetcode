class Solution {
    func stoneGameVII(_ stones: [Int]) -> Int {
        let n = stones.count
        var prefix = [Int](repeating: 0, count: n + 1)
        
        for i in 0..<n {
            prefix[i + 1] = prefix[i] + stones[i]
        }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

        if n >= 2 {
            for length in 2...n {
                for i in 0...(n - length) {
                    let j = i + length - 1
                    let total = prefix[j + 1] - prefix[i]
                    dp[i][j] = max(
                        total - stones[i] - dp[i + 1][j],
                        total - stones[j] - dp[i][j - 1]
                    )
                }
            }
        }

        return dp[0][n - 1]
    }
}
