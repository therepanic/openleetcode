class Solution {
    fun smallestDistancePair(nums: IntArray, k: Int): Int {
        nums.sort()
        val n = nums.size
        var low = 0
        var high = nums[n - 1] - nums[0]

        while (low < high) {
            val mid = low + (high - low) / 2
            var count = 0
            var j = 0
            for (i in 0 until n) {
                while (j < n && nums[j] - nums[i] <= mid) {
                    j++
                }
                count += j - i - 1
            }
            if (count < k) {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}
