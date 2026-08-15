class Solution {
    fun maximizeXor(nums: IntArray, queries: Array<IntArray>): IntArray {
        val trie = mutableListOf<IntArray>(intArrayOf(-1, -1))
        fun insert(num: Int) {
            var node = 0
            for (i in 31 downTo 0) {
                val bit = (num shr i) and 1
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.size
                    trie.add(intArrayOf(-1, -1))
                }
                node = trie[node][bit]
            }
        }
        fun maxor(num: Int): Int {
            if (trie[0][0] == -1 && trie[0][1] == -1) return -1
            var node = 0
            var ans = 0
            for (i in 31 downTo 0) {
                val bit = (num shr i) and 1
                val opp = 1 - bit
                if (trie[node][opp] != -1) {
                    ans = ans or (1 shl i)
                    node = trie[node][opp]
                } else {
                    node = trie[node][bit]
                }
            }
            return ans
        }

        nums.sort()
        val q = mutableListOf<IntArray>()
        for (i in queries.indices) {
            q.add(intArrayOf(queries[i][1], queries[i][0], i))
        }
        q.sortBy { it[0] }
        val res = IntArray(queries.size) { -1 }
        var idx = 0
        val n = nums.size
        for (item in q) {
            val m = item[0]
            val x = item[1]
            val i = item[2]
            while (idx < n && nums[idx] <= m) {
                insert(nums[idx])
                idx++
            }
            res[i] = maxor(x)
        }
        return res
    }
}
