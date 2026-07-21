class Solution {
    func maxSumDivThree(_ nums: [Int]) -> Int {
        let n = nums.count
        let minus = -(1 << 30)
        var dp = [[0, 0, 0], [0, minus, minus]]
        for i in 0..<n {
            let x = nums[i]
            let x3 = x % 3
            for mod in 0..<3 {
                let modPrev = (3 + mod - x3) % 3
                let take = x + dp[(i + 1) & 1][modPrev]
                let skip = dp[(i + 1) & 1][mod]
                dp[i & 1][mod] = max(take, skip)
            }
        }
        return max(0, dp[(n - 1) & 1][0])
    }
}
