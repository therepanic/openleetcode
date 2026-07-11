class Solution {
    func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
        var minVal = nums[0]
        var maxVal = nums[0]
        
        for val in nums {
            if val < minVal {
                minVal = val
            } else if val > maxVal {
                maxVal = val
            }
        }
        
        return max(0, maxVal - minVal - k * 2)
    }
}
