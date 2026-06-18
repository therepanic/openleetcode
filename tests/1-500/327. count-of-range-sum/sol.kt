class Solution {
    fun countRangeSum(nums: IntArray, lower: Int, upper: Int): Int {
        val prefix = LongArray(nums.size + 1)
        for (i in nums.indices) {
            prefix[i + 1] = prefix[i] + nums[i]
        }

        val buffer = LongArray(prefix.size)
        return countWhileMergeSort(prefix, buffer, 0, prefix.size, lower.toLong(), upper.toLong()).toInt()
    }

    private fun countWhileMergeSort(
        prefix: LongArray,
        buffer: LongArray,
        left: Int,
        right: Int,
        lower: Long,
        upper: Long
    ): Long {
        if (right - left <= 1) {
            return 0L
        }

        val mid = left + (right - left) / 2
        var count = countWhileMergeSort(prefix, buffer, left, mid, lower, upper) +
                countWhileMergeSort(prefix, buffer, mid, right, lower, upper)

        var low = mid
        var high = mid
        for (i in left until mid) {
            while (low < right && prefix[low] - prefix[i] < lower) {
                low++
            }
            while (high < right && prefix[high] - prefix[i] <= upper) {
                high++
            }
            count += (high - low).toLong()
        }

        var p1 = left
        var p2 = mid
        var idx = left
        while (p1 < mid && p2 < right) {
            if (prefix[p1] <= prefix[p2]) {
                buffer[idx++] = prefix[p1++]
            } else {
                buffer[idx++] = prefix[p2++]
            }
        }
        while (p1 < mid) {
            buffer[idx++] = prefix[p1++]
        }
        while (p2 < right) {
            buffer[idx++] = prefix[p2++]
        }
        for (i in left until right) {
            prefix[i] = buffer[i]
        }

        return count
    }
}
