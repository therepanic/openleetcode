import java.util.PriorityQueue

class Solution {
    fun assignTasks(servers: IntArray, tasks: IntArray): IntArray {
        val n = servers.size
        val m = tasks.size
        
        val available = PriorityQueue<Pair<Int, Int>>(compareBy({ it.first }, { it.second }))
        for (i in 0 until n) {
            available.offer(Pair(servers[i], i))
        }
        
        val busy = PriorityQueue<Triple<Int, Int, Int>>(compareBy { it.first })
        val ans = IntArray(m)
        var time = 0
        
        for (i in 0 until m) {
            time = maxOf(time, i)
            while (busy.isNotEmpty() && busy.peek().first <= time) {
                val (_, weight, idx) = busy.poll()
                available.offer(Pair(weight, idx))
            }
            
            if (available.isEmpty()) {
                time = busy.peek().first
                while (busy.isNotEmpty() && busy.peek().first <= time) {
                    val (_, weight, idx) = busy.poll()
                    available.offer(Pair(weight, idx))
                }
            }
            
            val (weight, idx) = available.poll()
            busy.offer(Triple(time + tasks[i], weight, idx))
            ans[i] = idx
        }
        
        return ans
    }
}
