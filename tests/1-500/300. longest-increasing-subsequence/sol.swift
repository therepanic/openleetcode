class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let prevIdx = -1
        var dp = Array(repeating: Array(repeating: -1, count: 2500), count: 2500)
        return helper(0, prevIdx, nums, &dp)
    }

    private func helper(_ i: Int, _ prevIdx: Int, _ nums: [Int], _ dp: inout [[Int]]) -> Int {
        if i >= nums.count {
            return 0
        }
        if dp[i][prevIdx + 1] != -1 {
            return dp[i][prevIdx + 1]
        }
        var steal = 0
        var skip = 0
        if prevIdx == -1 || nums[prevIdx] < nums[i] {
            steal = 1 + helper(i + 1, i, nums, &dp)
        }
        skip = helper(i + 1, prevIdx, nums, &dp)
        dp[i][prevIdx + 1] = max(steal, skip)
        return max(steal, skip)
    }
}
