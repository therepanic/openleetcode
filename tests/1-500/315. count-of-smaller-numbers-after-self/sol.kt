class Solution {
    fun countSmaller(nums: IntArray): List<Int> {
        val sortedList = mutableListOf<Int>()
        val ans = mutableListOf<Int>()
        for (i in nums.size - 1 downTo 0) {
            val n = nums[i]
            val idx = bisectLeft(sortedList, n)
            ans.add(idx)
            sortedList.add(idx, n)
        }
        ans.reverse()
        return ans
    }
    
    private fun bisectLeft(list: List<Int>, target: Int): Int {
        var lo = 0
        var hi = list.size
        while (lo < hi) {
            val mid = lo + (hi - lo) / 2
            if (list[mid] >= target) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
