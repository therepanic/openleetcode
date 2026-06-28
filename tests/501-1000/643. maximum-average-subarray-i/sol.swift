class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var windowSum = nums[0..<k].reduce(0, +)
        var maxSum = windowSum
        
        for i in k..<nums.count {
            windowSum = windowSum - nums[i - k] + nums[i]
            maxSum = max(maxSum, windowSum)
        }
        
        return Double(maxSum) / Double(k)
    }
}
