class Solution {
    func numPermsDISequence(_ s: String) -> Int {
        let n = s.count
        let MOD = 1000000007
        var dp = [1]
        let arr = Array(s)
        for i in 1...n {
            var prefix = [Int](repeating: 0, count: i + 1)
            prefix[0] = dp[0]
            for j in 1..<i {
                prefix[j] = (prefix[j-1] + dp[j]) % MOD
            }
            prefix[i] = prefix[i-1] % MOD
            var ndp = [Int](repeating: 0, count: i + 1)
            if arr[i-1] == Character("I") {
                for j in 0...i {
                    ndp[j] = j > 0 ? prefix[j-1] % MOD : 0
                }
            } else {
                for j in 0...i {
                    ndp[j] = (prefix[i-1] - (j > 0 ? prefix[j-1] : 0)) % MOD
                    if ndp[j] < 0 { ndp[j] += MOD }
                }
            }
            dp = ndp
        }
        return dp.reduce(0) { ($0 + $1) % MOD }
    }
}
