class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let MOD = 1_000_000_007
        let arr = arr.sorted()
        var dp = [Int: Int]()
        let s = Set(arr)
        for x in arr {
            dp[x] = 1
            for a in arr {
                if a > x { break }
                if x % a == 0 {
                    let b = x / a
                    if s.contains(b) {
                        dp[x] = (dp[x]! + dp[a]! * dp[b]!) % MOD
                    }
                }
            }
        }
        return dp.values.reduce(0, { ($0 + $1) % MOD })
    }
}
