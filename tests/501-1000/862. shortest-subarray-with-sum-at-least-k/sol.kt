class Solution {
    fun shortestSubarray(nums: IntArray, k: Int): Int {
        val n = nums.size
        val prefix = LongArray(n + 1)
        for (i in 0 until n) {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        
        var best = n + 1
        val dq = java.util.ArrayDeque<Int>()
        for (i in prefix.indices) {
            while (!dq.isEmpty() && prefix[i] - prefix[dq.first()] >= k) {
                best = minOf(best, i - dq.pollFirst())
            }
            while (!dq.isEmpty() && prefix[dq.last()] >= prefix[i]) {
                dq.pollLast()
            }
            dq.addLast(i)
        }
        
        return if (best == n + 1) -1 else best
    }
}
