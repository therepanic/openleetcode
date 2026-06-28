class Solution {
    fun openLock(deadends: Array<String>, target: String): Int {
        if (target == "0000") return 0
        val dead = deadends.toSet()
        if ("0000" in dead) return -1
        
        var moves = 0
        val queue: java.util.Queue<String> = java.util.LinkedList()
        val visited = mutableSetOf("0000")
        queue.offer("0000")
        
        while (queue.isNotEmpty()) {
            repeat(queue.size) {
                val cur = queue.poll()
                if (cur == target) return moves
                
                for (i in 0..3) {
                    val v = cur[i] - '0'
                    val up = (v + 1) % 10
                    val down = (v - 1 + 10) % 10
                    
                    val nxt1 = cur.substring(0, i) + up + cur.substring(i + 1)
                    val nxt2 = cur.substring(0, i) + down + cur.substring(i + 1)
                    
                    if (nxt1 !in dead && nxt1 !in visited) {
                        visited.add(nxt1)
                        queue.offer(nxt1)
                    }
                    if (nxt2 !in dead && nxt2 !in visited) {
                        visited.add(nxt2)
                        queue.offer(nxt2)
                    }
                }
            }
            moves++
        }
        return -1
    }
}
