class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let total = nums.reduce(0, +)
        if abs(target) > total || (target + total) % 2 != 0 {
            return 0
        }
        let sum = (target + total) / 2
        var dp = [Int](repeating: 0, count: sum + 1)
        dp[0] = 1

        for num in nums {
            for j in stride(from: sum, through: num, by: -1) {
                dp[j] += dp[j - num]
            }
        }

        return dp[sum]
    }
}
