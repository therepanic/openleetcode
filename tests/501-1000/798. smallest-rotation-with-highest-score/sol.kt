class Solution {
    fun bestRotation(nums: IntArray): Int {
        val n = nums.size
        val diffs = IntArray(n + 1)
        for (i in 0 until n) {
            val left = ((i - nums[i] + 1) % n + n) % n
            val right = (i + 1) % n
            diffs[left]--
            diffs[right]++
            if (left > right) {
                diffs[0]--
            }
        }
        var best = 0
        var cur = n
        var maxScore = cur
        for (k in 1 until n) {
            cur += diffs[k]
            if (cur > maxScore) {
                maxScore = cur
                best = k
            }
        }
        return best
    }
}
