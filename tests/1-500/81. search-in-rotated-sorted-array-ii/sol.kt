class Solution {
    fun search(nums: IntArray, target: Int): Boolean {
        var left = 0
        var right = nums.lastIndex

        while (left <= right) {
            val mid = left + (right - left) / 2
            if (nums[mid] == target) return true

            if (nums[left] == nums[mid]) {
                left++
            } else if (nums[left] <= nums[mid]) {
                if (nums[left] <= target && target < nums[mid]) right = mid - 1 else left = mid + 1
            } else {
                if (nums[mid] < target && target <= nums[right]) left = mid + 1 else right = mid - 1
            }
        }

        return false
    }
}
