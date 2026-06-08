class Solution {
    fun searchInsert(nums: IntArray, target: Int): Int {
        var low = 0
        var high = nums.size - 1

        while (low <= high) {
            val mid = low + (high - low) / 2
            if (nums[mid] < target) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return low
    }
}
