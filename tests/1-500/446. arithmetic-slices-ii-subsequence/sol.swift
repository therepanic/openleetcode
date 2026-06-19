class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        let n = nums.count
        var totalCount = 0
        var dp = Array(repeating: [Int: Int](), count: n)

        for i in 1..<n {
            for j in 0..<i {
                let diff = nums[i] - nums[j]
                dp[i][diff, default: 0] += 1
                if let cnt = dp[j][diff] {
                    dp[i][diff, default: 0] += cnt
                    totalCount += cnt
                }
            }
        }

        return totalCount
    }
}
