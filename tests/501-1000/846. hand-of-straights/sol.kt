class Solution {
    fun isNStraightHand(hand: IntArray, groupSize: Int): Boolean {
        val hashmap = mutableMapOf<Int, Int>()
        for (h in hand) {
            hashmap[h] = hashmap.getOrDefault(h, 0) + 1
        }
        
        val minHeap = java.util.PriorityQueue(hashmap.keys)
        
        while (minHeap.isNotEmpty()) {
            val first = minHeap.peek()
            for (i in first until first + groupSize) {
                if (!hashmap.containsKey(i)) {
                    return false
                }
                hashmap[i] = hashmap[i]!! - 1
                if (hashmap[i] == 0) {
                    if (i != minHeap.peek()) {
                        return false
                    }
                    minHeap.poll()
                }
            }
        }
        return true
    }
}
