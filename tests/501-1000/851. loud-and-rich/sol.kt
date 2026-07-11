class Solution {
    fun loudAndRich(richer: Array<IntArray>, quiet: IntArray): IntArray {
        val n = quiet.size
        val graph = Array(n) { mutableListOf<Int>() }
        for (pair in richer) {
            graph[pair[1]].add(pair[0])
        }
        
        val answer = IntArray(n) { -1 }
        
        fun dfs(i: Int): Int {
            if (answer[i] != -1) return answer[i]
            answer[i] = i
            for (nei in graph[i]) {
                val item = dfs(nei)
                if (quiet[item] < quiet[answer[i]]) {
                    answer[i] = item
                }
            }
            return answer[i]
        }
        
        for (i in 0 until n) {
            dfs(i)
        }
        return answer
    }
}
