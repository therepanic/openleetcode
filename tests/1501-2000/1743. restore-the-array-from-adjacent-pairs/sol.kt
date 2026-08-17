class Solution {
    fun restoreArray(adjacentPairs: Array<IntArray>): IntArray {
        val xorMap = mutableMapOf<Int, Int>()
        val degree = mutableMapOf<Int, Int>()

        for (pair in adjacentPairs) {
            val u = pair[0]
            val v = pair[1]
            xorMap[u] = xorMap.getOrDefault(u, 0) xor v
            xorMap[v] = xorMap.getOrDefault(v, 0) xor u
            degree[u] = degree.getOrDefault(u, 0) + 1
            degree[v] = degree.getOrDefault(v, 0) + 1
        }

        var start = 0
        for ((key, value) in degree) {
            if (value == 1) {
                start = key
                break
            }
        }

        val n = adjacentPairs.size + 1
        val res = IntArray(n)

        res[0] = start
        var prev = 0

        for (i in 1 until n) {
            res[i] = (xorMap[res[i - 1]] ?: 0) xor prev
            prev = res[i - 1]
        }

        return res
    }
}
