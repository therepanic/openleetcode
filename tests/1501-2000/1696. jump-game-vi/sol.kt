class Solution {
    fun maxResult(nums: IntArray, k: Int): Int {
        val n = nums.size
        val dp = IntArray(n)
        dp[0] = nums[0]
        val dq = ArrayDeque<Int>()
        dq.addLast(0)
        for (i in 1 until n) {
            while (!dq.isEmpty() && dq.first() < i - k) {
                dq.removeFirst()
            }
            dp[i] = nums[i] + dp[dq.first()]
            while (!dq.isEmpty() && dp[dq.last()] <= dp[i]) {
                dq.removeLast()
            }
            dq.addLast(i)
        }
        return dp[n-1]
    }
}
