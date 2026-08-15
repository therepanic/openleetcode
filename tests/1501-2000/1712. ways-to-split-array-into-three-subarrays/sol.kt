class Solution {
    fun waysToSplit(nums: IntArray): Int {
        val MOD = 1_000_000_007
        val n = nums.size
        val prefix = LongArray(n)
        prefix[0] = nums[0].toLong()
        
        for (i in 1 until n) {
            prefix[i] = prefix[i - 1] + nums[i]
        }
        
        var res = 0L
        for (i in 0 until n - 2) {
            val left = prefix[i]
            val j = lowerBound(prefix, 2 * left, i + 1, n - 1)
            val k = upperBound(prefix, (prefix[n - 1] + left) / 2, j, n - 1)
            if (j < k) {
                res = (res + (k - j)) % MOD
            }
        }
        return res.toInt()
    }
    
    private fun lowerBound(arr: LongArray, target: Long, lo: Int, hi: Int): Int {
        var l = lo
        var h = hi
        while (l < h) {
            val mid = (l + h) / 2
            if (arr[mid] < target) {
                l = mid + 1
            } else {
                h = mid
            }
        }
        return l
    }
    
    private fun upperBound(arr: LongArray, target: Long, lo: Int, hi: Int): Int {
        var l = lo
        var h = hi
        while (l < h) {
            val mid = (l + h) / 2
            if (arr[mid] <= target) {
                l = mid + 1
            } else {
                h = mid
            }
        }
        return l
    }
}
