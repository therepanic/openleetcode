class Solution {
    func rearrangeSticks(_ n: Int, _ k: Int) -> Int {
        let mod = 1000000007
        var dp = [Int](repeating: 0, count: k + 1)
        dp[0] = 1
        for length in 1...n {
            var nxt = [Int](repeating: 0, count: k + 1)
            for visible in 1...min(length, k) {
                nxt[visible] = (dp[visible - 1] + (length - 1) * dp[visible]) % mod
            }
            dp = nxt
        }
        return dp[k]
    }
}
