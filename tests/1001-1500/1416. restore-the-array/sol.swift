class Solution {
    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        let mod = 1000000007
        let chars = Array(s)
        let n = chars.count
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        let width = String(k).count
        for i in 0..<n {
            if chars[i] == "0" || dp[i] == 0 { continue }
            var value = 0
            for j in i..<min(n, i + width) {
                value = value * 10 + Int(chars[j].asciiValue! - 48)
                if value > k { break }
                dp[j + 1] = (dp[j + 1] + dp[i]) % mod
            }
        }
        return dp[n]
    }
}
