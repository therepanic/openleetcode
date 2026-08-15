class Solution {
    fun findSmallestSetOfVertices(n: Int, edges: List<List<Int>>): List<Int> {
        val hasIncoming = BooleanArray(n)
        for (edge in edges) {
            hasIncoming[edge[1]] = true
        }
        return (0 until n).filter { !hasIncoming[it] }
    }
}
