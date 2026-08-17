class Solution {
    fun maximumDifference(nums: IntArray): Int {
        var minVal = nums[0]
        var maxDiff = -1
        for (i in 1 until nums.size) {
            if (nums[i] > minVal) {
                maxDiff = maxOf(maxDiff, nums[i] - minVal)
            } else {
                minVal = nums[i]
            }
        }
        return maxDiff
    }
}
