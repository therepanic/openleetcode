import java.util.PriorityQueue

class Solution {
    fun furthestBuilding(heights: IntArray, bricks: Int, ladders: Int): Int {
        var bricks = bricks
        val heap = PriorityQueue<Int>()
        val n = heights.size
        for (i in 1 until n) {
            val climb = heights[i] - heights[i-1]
            if (climb <= 0) continue
            heap.offer(climb)
            if (heap.size > ladders) {
                val diff = heap.poll()
                if (bricks >= diff) {
                    bricks -= diff
                } else {
                    return i-1
                }
            }
        }
        return n-1
    }
}
