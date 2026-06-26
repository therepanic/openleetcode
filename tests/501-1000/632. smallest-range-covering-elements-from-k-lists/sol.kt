class Solution {
    fun smallestRange(nums: List<List<Int>>): IntArray {
        val heap = java.util.PriorityQueue<IntArray>(compareBy { it[0] })
        var curMax = Int.MIN_VALUE
        for (i in nums.indices) {
            val v = nums[i][0]
            heap.offer(intArrayOf(v, i, 0))
            curMax = maxOf(curMax, v)
        }
        var small = intArrayOf(Int.MIN_VALUE, Int.MAX_VALUE)
        while (heap.isNotEmpty()) {
            val (curMin, listIdx, i) = heap.poll()
            if (curMax.toLong() - curMin < small[1].toLong() - small[0]) {
                small = intArrayOf(curMin, curMax)
            }
            if (i + 1 < nums[listIdx].size) {
                val nxt = nums[listIdx][i + 1]
                heap.offer(intArrayOf(nxt, listIdx, i + 1))
                curMax = maxOf(curMax, nxt)
            } else {
                break
            }
        }
        return small
    }
}
