class Solution {
    fun smallestRangeI(nums: IntArray, k: Int): Int {
        var minVal = nums[0]
        var maxVal = nums[0]
        
        for (num in nums) {
            if (num < minVal) {
                minVal = num
            } else if (num > maxVal) {
                maxVal = num
            }
        }
        
        return maxOf(0, maxVal - minVal - k * 2)
    }
}
