class Solution {
    fun getSkyline(buildings: Array<IntArray>): List<List<Int>> {
        val events = mutableListOf<IntArray>()
        for (b in buildings) {
            val (L, R, H) = b
            events.add(intArrayOf(L, -H))
            events.add(intArrayOf(R, H))
        }
        events.sortWith(compareBy({ it[0] }, { it[1] }))
        
        val result = mutableListOf<List<Int>>()
        val liveBuildings = java.util.PriorityQueue<Int>(compareByDescending { it })
        liveBuildings.offer(0)
        val pastBuildings = mutableMapOf<Int, Int>()
        var prevMax = 0
        
        for (event in events) {
            val x = event[0]
            val h = event[1]
            
            if (h < 0) {
                liveBuildings.offer(-h)
            } else {
                pastBuildings[h] = pastBuildings.getOrDefault(h, 0) + 1
            }
            
            while (liveBuildings.isNotEmpty() && pastBuildings.containsKey(liveBuildings.peek())) {
                val top = liveBuildings.poll()
                pastBuildings[top] = pastBuildings[top]!! - 1
                if (pastBuildings[top] == 0) {
                    pastBuildings.remove(top)
                }
            }
            
            val currMax = liveBuildings.peek() ?: 0
            if (currMax != prevMax) {
                result.add(listOf(x, currMax))
                prevMax = currMax
            }
        }
        
        return result
    }
}
