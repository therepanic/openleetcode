class Solution {
    fun minMoves(nums: IntArray, k: Int): Int {
        val idx = mutableListOf<Int>()
        for (i in nums.indices) {
            if (nums[i] == 1) idx.add(i)
        }
        val n = idx.size
        val a = LongArray(n)
        for (i in 0 until n) {
            a[i] = (idx[i] - i).toLong()
        }
        val prefix = LongArray(n)
        if (n > 0) {
            prefix[0] = a[0]
            for (i in 1 until n) {
                prefix[i] = prefix[i-1] + a[i]
            }
        }
        var ans = Long.MAX_VALUE
        var l = 0
        for (r in 0 until n) {
            while (r - l + 1 > k) l++
            if (r - l + 1 == k) {
                val mid = (l + r) / 2
                val med = a[mid]
                val leftSum = prefix[mid] - if (l > 0) prefix[l-1] else 0L
                val rightSum = prefix[r] - prefix[mid]
                val cost = (med * (mid - l + 1) - leftSum) + (rightSum - med * (r - mid))
                ans = minOf(ans, cost)
            }
        }
        return ans.toInt()
    }
}
