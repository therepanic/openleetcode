class Solution {
    fun maxSumTwoNoOverlap(nums: IntArray, firstLen: Int, secondLen: Int): Int {
        return maxOf(solve(nums, firstLen, secondLen), solve(nums, secondLen, firstLen))
    }

    private fun solve(nums: IntArray, firstLen: Int, secondLen: Int): Int {
        val n = nums.size
        val prefix = IntArray(n + 1)
        for (i in 0 until n) {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        var bestA = prefix[firstLen]
        var ans = 0
        for (end in firstLen + secondLen..n) {
            bestA = maxOf(bestA, prefix[end - secondLen] - prefix[end - secondLen - firstLen])
            ans = maxOf(ans, bestA + prefix[end] - prefix[end - secondLen])
        }
        return ans
    }
}
