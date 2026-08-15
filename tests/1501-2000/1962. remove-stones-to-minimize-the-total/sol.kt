import java.util.PriorityQueue

class Solution {
    fun minStoneSum(piles: IntArray, k: Int): Int {
        val maxHeap = PriorityQueue<Int>(compareByDescending { it })
        for (p in piles) maxHeap.add(p)
        repeat(k) {
            val x = maxHeap.poll()
            val reduced = (x + 1) / 2
            maxHeap.add(reduced)
        }
        return maxHeap.sum()
    }
}
