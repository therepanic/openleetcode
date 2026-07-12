class Solution {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 2 {
            return n
        }
        var dp = Array(repeating: [Int: Int](), count: n)
        var ans = 2
        for i in 0..<n {
            for j in 0..<i {
                let d = nums[i] - nums[j]
                let prev = dp[j][d] ?? 1
                dp[i][d] = max(dp[i][d] ?? 0, prev + 1)
                ans = max(ans, dp[i][d]!)
            }
        }
        return ans
    }
}
