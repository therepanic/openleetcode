class Solution {
    fun minChanges(nums: IntArray, k: Int): Int {
        val freq = HashMap<Int, HashMap<Int, Int>>()
        for (i in nums.indices) {
            freq.getOrPut(i % k) { HashMap() }.merge(nums[i], 1) { a, b -> a + b }
        }
        
        val n = 1 shl 10
        var dp = IntArray(n) { Int.MIN_VALUE }
        dp[0] = 0
        for (i in 0 until k) {
            val mx = dp.max()
            val tmp = IntArray(n)
            for (x in 0 until n) {
                val c = dp[x]
                freq[i]?.forEach { (xx, cc) ->
                    tmp[x xor xx] = maxOf(tmp[x xor xx], c + cc, mx)
                }
            }
            dp = tmp
        }
        return nums.size - dp[0]
    }
}
