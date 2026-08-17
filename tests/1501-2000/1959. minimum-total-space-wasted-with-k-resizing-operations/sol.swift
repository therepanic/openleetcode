class Solution {
    func minSpaceWastedKResizing(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var P = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            P[i+1] = P[i] + nums[i]
        }
        let inf = 1_000_000_000
        var dp = [Int](repeating: inf, count: n + 1)
        var maxV = 0
        for i in 1...n {
            maxV = max(maxV, nums[i-1])
            dp[i] = maxV * i - P[i]
        }
        for _ in 0..<k {
            var newDp = [Int](repeating: inf, count: n + 1)
            newDp[0] = 0
            for i in 1...n {
                var curMax = 0
                for j in stride(from: i-1, through: 0, by: -1) {
                    curMax = max(curMax, nums[j])
                    let waste = curMax * (i - j) - (P[i] - P[j])
                    if dp[j] != inf { newDp[i] = min(newDp[i], dp[j] + waste) }
                }
            }
            dp = newDp
        }
        return dp[n]
    }
}
