class Solution {
    fun crackSafe(n: Int, k: Int): String {
        if (n == 1) {
            return (0 until k).joinToString("")
        }

        val adj = mutableMapOf<String, ArrayDeque<Int>>()
        val startNode = "0".repeat(n - 1)
        val path = ArrayDeque<String>()
        val edgePath = ArrayDeque<Int>()
        val res = StringBuilder()

        path.addLast(startNode)
        while (path.isNotEmpty()) {
            val node = path.last()
            if (!adj.containsKey(node)) {
                adj[node] = ArrayDeque()
                for (i in (k - 1) downTo 0) {
                    adj[node]!!.addLast(i)
                }
            }
            if (adj[node]!!.isNotEmpty()) {
                val digit = adj[node]!!.removeLast()
                path.addLast((node + digit).substring(1))
                edgePath.addLast(digit)
            } else {
                path.removeLast()
                if (edgePath.isNotEmpty()) {
                    res.append(edgePath.removeLast())
                }
            }
        }

        return res.toString() + startNode
    }
}
