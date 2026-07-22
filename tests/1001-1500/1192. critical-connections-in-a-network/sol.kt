class Solution {
    fun criticalConnections(n: Int, connections: Array<IntArray>): List<List<Int>> {
        val graph = Array(n) { mutableListOf<Int>() }
        for (edge in connections) {
            graph[edge[0]].add(edge[1])
            graph[edge[1]].add(edge[0])
        }
        
        val disc = IntArray(n) { -1 }
        val low = IntArray(n)
        var timer = 0
        val bridges = mutableListOf<List<Int>>()
        val iterIdx = IntArray(n)
        
        for (start in 0 until n) {
            if (disc[start] != -1) continue
            
            val stack = ArrayDeque<IntArray>()
            disc[start] = timer
            low[start] = timer
            timer++
            stack.addLast(intArrayOf(start, -1))
            
            while (stack.isNotEmpty()) {
                val top = stack.last()
                val node = top[0]
                val parent = top[1]
                val neighbors = graph[node]
                val idx = iterIdx[node]
                
                if (idx < neighbors.size) {
                    val nb = neighbors[idx]
                    iterIdx[node]++
                    if (nb == parent) continue
                    
                    if (disc[nb] == -1) {
                        disc[nb] = timer
                        low[nb] = timer
                        timer++
                        stack.addLast(intArrayOf(nb, node))
                    } else {
                        low[node] = minOf(low[node], disc[nb])
                    }
                } else {
                    stack.removeLast()
                    if (stack.isNotEmpty()) {
                        val par = stack.last()[0]
                        low[par] = minOf(low[par], low[node])
                        if (low[node] > disc[par]) {
                            bridges.add(listOf(par, node))
                        }
                    }
                }
            }
        }
        
        return bridges
    }
}
