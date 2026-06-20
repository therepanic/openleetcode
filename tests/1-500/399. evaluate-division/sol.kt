class Solution {
    fun calcEquation(equations: Array<Array<String>>, values: FloatArray, queries: Array<Array<String>>): DoubleArray {
        val g = mutableMapOf<String, MutableMap<String, Double>>()
        for (i in equations.indices) {
            val a = equations[i][0]
            val b = equations[i][1]
            val v = values[i].toDouble()
            g.getOrPut(a) { mutableMapOf() }[b] = v
            g.getOrPut(b) { mutableMapOf() }[a] = 1.0 / v
        }
        
        fun dfs(x: String, y: String): Double {
            if (x !in g || y !in g) return -1.0
            if (x == y) return 1.0
            val s = ArrayDeque<Pair<String, Double>>()
            val visited = mutableSetOf<String>()
            s.addLast(x to 1.0)
            while (s.isNotEmpty()) {
                val (c, r) = s.removeLast()
                if (c == y) return r
                visited.add(c)
                for ((n, w) in g[c]!!) {
                    if (n !in visited) {
                        s.addLast(n to r * w)
                    }
                }
            }
            return -1.0
        }
        
        return queries.map { dfs(it[0], it[1]) }.toDoubleArray()
    }
}
