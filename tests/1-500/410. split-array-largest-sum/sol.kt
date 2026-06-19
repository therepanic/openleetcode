class Solution {
    private fun helper(nums: IntArray, perK: Int, k: Int): Boolean {
        var count = 1
        var currSum = 0
        for (num in nums) {
            if (currSum + num > perK) {
                count++
                currSum = num
            } else {
                currSum += num
            }
        }
        return count <= k
    }

    fun splitArray(nums: IntArray, k: Int): Int {
        var high = nums.sum()
        var low = nums.max()
        var soln = 0
        while (low <= high) {
            val mid = low + (high - low) / 2
            if (helper(nums, mid, k)) {
                soln = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return soln
    }
}
