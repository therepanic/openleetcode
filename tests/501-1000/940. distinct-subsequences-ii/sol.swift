class Solution {
    func distinctSubseqII(_ s: String) -> Int {
        let n = s.count
        let mod = 1000000007
        var dp = Array(repeating: 0, count: n)
        dp[0] = 2
        var mp = [Character: Int]()
        let chars = Array(s)
        mp[chars[0]] = 0
        for i in 1..<n {
            dp[i] = (2 * dp[i-1]) % mod
            if let idx = mp[chars[i]] {
                dp[i] -= idx > 0 ? dp[idx-1] : 1
                if dp[i] < 0 { dp[i] += mod }
            }
            mp[chars[i]] = i
            dp[i] %= mod
        }
        return (dp[n-1] - 1 + mod) % mod
    }
}
