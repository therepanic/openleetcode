class Solution {
    fun gardenNoAdj(n: Int, paths: Array<IntArray>): IntArray {
        val graph = mutableMapOf<Int, MutableList<Int>>()
        
        for (path in paths) {
            val u = path[0]
            val v = path[1]
            graph.computeIfAbsent(u) { mutableListOf() }.add(v)
            graph.computeIfAbsent(v) { mutableListOf() }.add(u)
        }
        
        for (node in 1..n) {
            graph.putIfAbsent(node, mutableListOf())
        }
        
        val answer = IntArray(n + 1)
        
        for (i in 1..n) {
            val used = mutableSetOf<Int>()
            for (nei in graph[i]!!) {
                used.add(answer[nei])
            }
            
            for (flower in 1..4) {
                if (flower !in used) {
                    answer[i] = flower
                    break
                }
            }
        }
        
        return answer.sliceArray(1..n)
    }
}
