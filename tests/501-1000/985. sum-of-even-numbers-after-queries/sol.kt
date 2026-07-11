class Solution {
    fun sumEvenAfterQueries(nums: IntArray, queries: Array<IntArray>): IntArray {
        var total = nums.filter { it % 2 == 0 }.sum()
        val ans = IntArray(queries.size)
        for (i in queries.indices) {
            val (delta, idx) = queries[i]
            if (nums[idx] % 2 == 0) total -= nums[idx]
            nums[idx] += delta
            if (nums[idx] % 2 == 0) total += nums[idx]
            ans[i] = total
        }
        return ans
    }
}
