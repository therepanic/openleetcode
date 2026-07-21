class Solution {
    fun checkIfPrerequisite(n: Int, prerequisites: Array<IntArray>, queries: Array<IntArray>): List<Boolean> {
        val reach = Array(n) { BooleanArray(n) }
        for (edge in prerequisites) reach[edge[0]][edge[1]] = true
        for (k in 0 until n)
            for (i in 0 until n)
                if (reach[i][k])
                    for (j in 0 until n) reach[i][j] = reach[i][j] || reach[k][j]
        return queries.map { reach[it[0]][it[1]] }
    }
}
