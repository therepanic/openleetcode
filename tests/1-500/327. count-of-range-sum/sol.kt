class Solution {
    fun countRangeSum(nums: IntArray, lower: Int, upper: Int): Int {
        val psum = LongArray(nums.size + 1)
        psum[0] = 0L
        for (i in nums.indices) {
            psum[i + 1] = psum[i] + nums[i]
        }

        val slist = mutableListOf<Long>()
        var result = 0
        for (i in psum.lastIndex downTo 0) {
            val pval = psum[i]
            val lo = pval + lower
            val hi = pval + upper

            val left = slist.bisectLeft(lo)
            val right = slist.bisectRight(hi)
            result += right - left

            val idx = slist.bisectLeft(pval)
            slist.add(idx, pval)
        }

        return result
    }
}

private fun List<Long>.bisectLeft(target: Long): Int {
    var lo = 0
    var hi = size
    while (lo < hi) {
        val mid = lo + (hi - lo) / 2
        if (this[mid] < target) {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}

private fun List<Long>.bisectRight(target: Long): Int {
    var lo = 0
    var hi = size
    while (lo < hi) {
        val mid = lo + (hi - lo) / 2
        if (this[mid] <= target) {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
