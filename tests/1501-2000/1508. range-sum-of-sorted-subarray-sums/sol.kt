class Solution {
    fun rangeSum(nums: IntArray, n: Int, left: Int, right: Int): Int {
        val MOD = 1000000007
        val sums = mutableListOf<Long>()
        for (i in 0 until n) {
            var total = 0L
            for (j in i until n) {
                total += nums[j]
                sums.add(total)
            }
        }
        sums.sort()
        var result = 0L
        for (i in left - 1 until right) {
            result = (result + sums[i]) % MOD
        }
        return result.toInt()
    }
}
