class Solution {
    fun largestDivisibleSubset(nums: IntArray): List<Int> {
        nums.sort()
        val n = nums.size
        val dp = IntArray(n) { 1 }
        val prev = IntArray(n) { -1 }
        var maxi = 0
        for (i in 1 until n) {
            for (j in 0 until i) {
                if (nums[i] % nums[j] == 0 && dp[i] < dp[j] + 1) {
                    dp[i] = dp[j] + 1
                    prev[i] = j
                }
            }
            if (dp[i] > dp[maxi]) {
                maxi = i
            }
        }
        val res = mutableListOf<Int>()
        var i = maxi
        while (i >= 0) {
            res.add(nums[i])
            i = prev[i]
        }
        return res.reversed()
    }
}
