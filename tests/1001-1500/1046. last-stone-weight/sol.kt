class Solution {
    fun lastStoneWeight(stones: IntArray): Int {
        val heap = java.util.PriorityQueue<Int>(compareByDescending { it })
        
        for (stone in stones) {
            heap.offer(stone)
        }
        
        while (heap.size > 1) {
            val maxStone1 = heap.poll()
            val maxStone2 = heap.poll()
            
            if (maxStone1 != maxStone2) {
                heap.offer(maxStone1 - maxStone2)
            }
        }
        
        return if (heap.isEmpty()) 0 else heap.poll()
    }
}
