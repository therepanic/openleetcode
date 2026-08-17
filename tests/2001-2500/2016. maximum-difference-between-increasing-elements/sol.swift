class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var minVal = nums[0]
        var maxDiff = -1
        for i in 1..<nums.count {
            if nums[i] > minVal {
                maxDiff = max(maxDiff, nums[i] - minVal)
            } else {
                minVal = nums[i]
            }
        }
        return maxDiff
    }
}
