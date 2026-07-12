class Solution {
    fun largestSumAfterKNegations(nums: IntArray, k: Int): Int {
        nums.sort()
        var remainingK = k
        for (i in nums.indices) {
            if (nums[i] < 0 && remainingK > 0) {
                nums[i] = -nums[i]
                remainingK--
            }
        }
        nums.sort()
        if (remainingK > 0 && remainingK % 2 != 0) {
            nums[0] = -nums[0]
        }
        return nums.sum()
    }
}
