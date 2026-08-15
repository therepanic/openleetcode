class Solution {
    func numberOfCombinations(_ num: String) -> Int {
        let n = num.count
        if n == 0 || num.first == "0" { return 0 }
        let mod = 1_000_000_007
        let chars = Array(num)
        var lcp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
        if n > 0 {
            for i in stride(from: n - 1, through: 0, by: -1) {
                for j in stride(from: n - 1, through: 0, by: -1) where chars[i] == chars[j] {
                    lcp[i][j] = lcp[i + 1][j + 1] + 1
                }
            }
        }

        func leq(_ a: Int, _ b: Int, _ length: Int) -> Bool {
            let common = min(lcp[a][b], length)
            if common == length { return true }
            return chars[a + common] < chars[b + common]
        }
        func greater(_ a: Int, _ b: Int, _ length: Int) -> Bool {
            if length == 0 { return false }
            let common = min(lcp[a][b], length)
            if common == length { return false }
            return chars[a + common] > chars[b + common]
        }

        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n)
        for i in 0..<n where chars[i] != "0" {
            for j in (i + 1)...n {
                if i == 0 {
                    dp[i][j] = 1
                    continue
                }
                let length = j - i
                var value = dp[i][j - 1]
                if i - length >= 0 && leq(i - length, i, length) {
                    value += dp[i - length][i]
                    if value >= mod { value -= mod }
                }
                if i - length + 1 >= 0 && greater(i - length + 1, i, length - 1) {
                    value += dp[i - length + 1][i]
                    if value >= mod { value -= mod }
                }
                dp[i][j] = value
            }
        }
        return dp.reduce(0) { ($0 + $1[n]) % mod }
    }
}
