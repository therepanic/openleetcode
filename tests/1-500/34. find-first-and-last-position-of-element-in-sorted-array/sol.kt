class Solution {
    private fun bound(nums: IntArray, target: Int, left: Boolean): Int {
        var low = 0
        var high = nums.size - 1
        var ans = -1

        while (low <= high) {
            val mid = low + (high - low) / 2
            if (nums[mid] < target) {
                low = mid + 1
            } else if (nums[mid] > target) {
                high = mid - 1
            } else {
                ans = mid
                if (left) {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }

        return ans
    }

    fun searchRange(nums: IntArray, target: Int): IntArray {
        return intArrayOf(bound(nums, target, true), bound(nums, target, false))
    }
}
