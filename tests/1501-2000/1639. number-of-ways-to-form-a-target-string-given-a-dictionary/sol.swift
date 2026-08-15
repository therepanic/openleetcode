class Solution {
    func numWays(_ words: [String], _ target: String) -> Int {
        let MOD: Int64 = 1_000_000_007
        let m = words[0].count
        var A = [[Int]](repeating: [Int](repeating: 0, count: 26), count: m)
        for word in words {
            let chars = Array(word)
            for j in 0..<m {
                A[j][Int(chars[j].asciiValue! - Character("a").asciiValue!)] += 1
            }
        }
        let targetChars = Array(target)
        var dp = [Int64](repeating: 0, count: target.count + 1)
        dp[0] = 1
        for column in 0..<m {
            for j in stride(from: min(column, target.count - 1), through: 0, by: -1) {
                let idx = Int(targetChars[j].asciiValue! - Character("a").asciiValue!)
                dp[j + 1] = (dp[j + 1] + Int64(A[column][idx]) * dp[j]) % MOD
            }
        }
        return Int(dp[target.count])
    }
}
