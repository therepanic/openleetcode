class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)
        if totalSum % 2 != 0 {
            return false
        }
        let targetSum = totalSum / 2
        var dp = [Bool](repeating: false, count: targetSum + 1)
        dp[0] = true
        for num in nums {
            for currSum in stride(from: targetSum, through: num, by: -1) {
                dp[currSum] = dp[currSum] || dp[currSum - num]
            }
        }
        return dp[targetSum]
    }
}
