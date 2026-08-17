class Solution {
    class TrieNode {
        var count: Int = 0
        var child: MutableMap<Int, TrieNode> = HashMap()
    }

    class BitTrie {
        var root = TrieNode()

        fun increase(number: Int, d: Int) {
            var cur = root
            for (i in 17 downTo 0) {
                val bit = (number shr i) and 1
                if (!cur.child.containsKey(bit)) cur.child[bit] = TrieNode()
                cur = cur.child[bit]!!
                cur.count += d
            }
        }

        fun findMax(number: Int): Int {
            var cur = root
            var ans = 0
            for (i in 17 downTo 0) {
                val bit = (number shr i) and 1
                val desired = 1 - bit
                if (cur.child.containsKey(desired) && cur.child[desired]!!.count > 0) {
                    cur = cur.child[desired]!!
                    ans = ans or (1 shl i)
                } else {
                    cur = cur.child[bit]!!
                }
            }
            return ans
        }
    }

    fun maxGeneticDifference(parents: IntArray, queries: Array<IntArray>): IntArray {
        val n = parents.size
        val adj = Array(n) { mutableListOf<Int>() }
        var root = 0
        for (i in 0 until n) {
            if (parents[i] == -1) root = i
            else adj[parents[i]].add(i)
        }

        val trie = BitTrie()
        val qmap = HashMap<Int, MutableList<Pair<Int, Int>>>()
        queries.forEachIndexed { idx, q ->
            qmap.getOrPut(q[0]) { mutableListOf() }.add(idx to q[1])
        }

        val ans = IntArray(queries.size)

        fun dfs(u: Int) {
            trie.increase(u, 1)
            qmap[u]?.forEach { (idx, value) ->
                ans[idx] = trie.findMax(value)
            }
            for (v in adj[u]) dfs(v)
            trie.increase(u, -1)
        }

        dfs(root)
        return ans
    }
}
