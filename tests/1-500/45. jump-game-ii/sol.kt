class Solution {
    fun jump(nums: IntArray): Int {
        val n = nums.size
        if (n <= 1) return 0

        var jumps = 0
        var currEnd = 0
        var maxReach = 0

        for (i in 0 until n - 1) {
            maxReach = max(maxReach, i + nums[i])
            if (i == currEnd) {
                jumps++
                currEnd = maxReach
                if (currEnd >= n - 1) break
            }
        }

        return jumps
    }
}
