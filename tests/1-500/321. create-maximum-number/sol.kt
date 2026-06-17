class Solution {
    fun maxNumber(nums1: IntArray, nums2: IntArray, k: Int): IntArray {
        var ans = intArrayOf()
        val m = nums1.size
        val n = nums2.size
        val start = maxOf(0, k - n)
        val end = minOf(m, k)
        for (i in start..end) {
            val sub1 = getMaxSubsequence(nums1, i)
            val sub2 = getMaxSubsequence(nums2, k - i)
            val merged = merge(sub1, sub2)
            if (greater(merged, 0, ans, 0)) {
                ans = merged
            }
        }
        return ans
    }

    private fun getMaxSubsequence(nums: IntArray, q: Int): IntArray {
        val stack = mutableListOf<Int>()
        var maxDrop = nums.size - q
        for (num in nums) {
            while (maxDrop > 0 && stack.isNotEmpty() && stack.last() < num) {
                stack.removeAt(stack.lastIndex)
                maxDrop--
            }
            if (stack.size < q) {
                stack.add(num)
            } else {
                maxDrop--
            }
        }
        return stack.toIntArray()
    }

    private fun merge(a: IntArray, b: IntArray): IntArray {
        val output = IntArray(a.size + b.size)
        var i = 0
        var j = 0
        var idx = 0
        while (i < a.size || j < b.size) {
            if (greater(a, i, b, j)) {
                output[idx++] = a[i++]
            } else {
                output[idx++] = b[j++]
            }
        }
        return output
    }

    private fun greater(a: IntArray, i: Int, b: IntArray, j: Int): Boolean {
        var idx1 = i
        var idx2 = j
        while (idx1 < a.size && idx2 < b.size && a[idx1] == b[idx2]) {
            idx1++
            idx2++
        }
        return idx2 == b.size || (idx1 < a.size && a[idx1] > b[idx2])
    }
}
