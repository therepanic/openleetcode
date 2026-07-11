class Solution {
    private fun merge(nums: IntArray, l: Int, mid: Int, r: Int) {
        val a = IntArray(mid - l + 1)
        val b = IntArray(r - mid)
        for (i in l..mid) {
            a[i - l] = nums[i]
        }
        for (j in mid + 1..r) {
            b[j - mid - 1] = nums[j]
        }
        var i = 0
        var j = 0
        var k = l
        while (k <= r) {
            when {
                j == b.size -> {
                    nums[k] = a[i]
                    i++
                }
                i == a.size -> {
                    nums[k] = b[j]
                    j++
                }
                a[i] <= b[j] -> {
                    nums[k] = a[i]
                    i++
                }
                else -> {
                    nums[k] = b[j]
                    j++
                }
            }
            k++
        }
    }

    private fun mergesort(nums: IntArray, l: Int, r: Int) {
        if (l >= r) return
        val mid = (l + r) / 2
        mergesort(nums, l, mid)
        mergesort(nums, mid + 1, r)
        merge(nums, l, mid, r)
    }

    fun sortArray(nums: IntArray): IntArray {
        mergesort(nums, 0, nums.size - 1)
        return nums
    }
}
