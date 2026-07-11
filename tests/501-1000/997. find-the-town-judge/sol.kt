class Solution {
    fun findJudge(n: Int, trust: Array<IntArray>): Int {
        val indegree = IntArray(n + 1)
        val outdegree = IntArray(n + 1)
        for (edge in trust) {
            val a = edge[0]
            val b = edge[1]
            outdegree[a]++
            indegree[b]++
        }
        for (i in 1..n) {
            if (outdegree[i] == 0 && indegree[i] == n - 1) {
                return i
            }
        }
        return -1
    }
}
