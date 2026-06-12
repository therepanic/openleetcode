class Solution {
    fun maximumGap(nums: IntArray): Int {
        if (nums.size < 2) return 0
        nums.sort()
        var best = 0
        for (i in 1 until nums.size) {
            best = maxOf(best, nums[i] - nums[i - 1])
        }
        return best
    }
}
