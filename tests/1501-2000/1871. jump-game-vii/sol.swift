class Solution {
    func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
        let n = s.count
        let chars = Array(s)
        if chars[n-1] == "1" { return false }

        var dp = [Bool](repeating: false, count: n)
        dp[0] = true

        var reachable = 0

        for i in 1..<n {
            if i >= minJump && dp[i - minJump] {
                reachable += 1
            }

            if i > maxJump && dp[i - maxJump - 1] {
                reachable -= 1
            }

            if reachable > 0 && chars[i] == "0" {
                dp[i] = true
            }
        }

        return dp[n-1]
    }
}
