class Solution {
    fun maxPerformance(n: Int, speed: IntArray, efficiency: IntArray, k: Int): Int {
        val MOD = 1000000007
        val engineers = Array(n) { i -> Pair(efficiency[i], speed[i]) }
        engineers.sortByDescending { it.first }
        
        val pq = java.util.PriorityQueue<Int>()
        var curSum = 0L
        var ans = 0L
        
        for ((e, s) in engineers) {
            while (pq.size > k - 1) {
                curSum -= pq.poll()
            }
            pq.offer(s)
            curSum += s
            ans = maxOf(ans, curSum * e)
        }
        
        return (ans % MOD).toInt()
    }
}
