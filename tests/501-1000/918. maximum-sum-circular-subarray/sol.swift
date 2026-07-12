class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var minSum = nums[0]
        var currMaxSum = nums[0]
        var currMinSum = nums[0]
        var totalSum = nums[0]
        
        for i in 1..<nums.count {
            currMaxSum = max(currMaxSum + nums[i], nums[i])
            maxSum = max(maxSum, currMaxSum)
            
            currMinSum = min(currMinSum + nums[i], nums[i])
            minSum = min(minSum, currMinSum)
            
            totalSum += nums[i]
        }
        
        let circularSum = totalSum - minSum
        
        if circularSum == 0 {
            return maxSum
        }
        
        return max(maxSum, circularSum)
    }
}
