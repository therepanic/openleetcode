class Solution {
    fun findCenter(edges: Array<IntArray>): Int {
        val a = edges[0][0]
        val b = edges[0][1]
        val c = edges[1][0]
        val d = edges[1][1]
        return if (a == c || a == d) a else b
    }
}
