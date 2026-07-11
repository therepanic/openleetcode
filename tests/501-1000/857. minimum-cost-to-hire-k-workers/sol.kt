class Solution {
    fun mincostToHireWorkers(quality: IntArray, wage: IntArray, k: Int): Double {
        val n = quality.size
        val workers = Array(n) { i -> Pair(wage[i].toDouble() / quality[i], quality[i]) }
        workers.sortBy { it.first }
        
        var minCost = Double.MAX_VALUE
        var currentQualitySum: Long = 0
        val maxHeap = java.util.PriorityQueue<Int>(compareByDescending { it })
        
        for ((ratio, q) in workers) {
            currentQualitySum += q
            maxHeap.offer(q)
            
            if (maxHeap.size > k) {
                currentQualitySum -= maxHeap.poll()
            }
            
            if (maxHeap.size == k) {
                minCost = minOf(minCost, ratio * currentQualitySum)
            }
        }
        
        return minCost
    }
}
