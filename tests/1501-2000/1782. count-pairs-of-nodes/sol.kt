import java.util.*

class Solution {
    fun countPairs(n: Int, edges: Array<IntArray>, queries: IntArray): IntArray {
        val x = HashMap<Int, MutableSet<Int>>()
        val edge = IntArray(n)
        val edgePair = HashMap<Pair<Int, Int>, Int>()

        for (e in edges) {
            val i = e[0] - 1
            val j = e[1] - 1
            x.getOrPut(i) { mutableSetOf() }.add(j)
            x.getOrPut(j) { mutableSetOf() }.add(i)
            edge[i]++
            edge[j]++
            edgePair[Pair(i, j)] = (edgePair[Pair(i, j)] ?: 0) + 1
            edgePair[Pair(j, i)] = (edgePair[Pair(j, i)] ?: 0) + 1
        }
        
        val res = edge.sorted()
        
        fun binse(threshold: Int): Int {
            var i = 0
            var j = n - 1
            var ans = n
            while (i <= j) {
                val mid = (i + j) / 2
                if (res[mid] > threshold) {
                    ans = mid
                    j = mid - 1
                } else {
                    i = mid + 1
                }
            }
            return n - ans
        }
        
        val result = IntArray(queries.size)
        for (qi in queries.indices) {
            val query = queries[qi]
            val v = mutableSetOf<Int>()
            var ans = 0
            
            fun f(i: Int) {
                v.add(i)
                var a = binse(query - edge[i])
                
                if (edge[i] > query - edge[i]) {
                    a--
                }
                
                for (j in x[i] ?: emptySet()) {
                    if (edge[j] > query - edge[i] && edge[j] - (edgePair[Pair(i, j)] ?: 0) <= query - edge[i]) {
                        a--
                    }
                    if (j !in v) {
                        f(j)
                    }
                }
                ans += a
            }
            
            for (j in 0 until n) {
                if (j !in v) {
                    f(j)
                }
            }
            result[qi] = ans / 2
        }
        return result
    }
}
