class Solution {
    fun findLexSmallestString(s: String, a: Int, b: Int): String {
        val n = s.length
        val seen = mutableSetOf<String>()
        val queue = java.util.ArrayDeque<String>()
        queue.add(s)
        while (queue.isNotEmpty()) {
            val cur = queue.removeFirst()
            if (!seen.add(cur)) continue
            val add = cur.toCharArray()
            for (i in 1 until n step 2) {
                add[i] = '0' + (add[i] - '0' + a) % 10
            }
            queue.add(String(add))
            queue.add(cur.substring(n - b) + cur.substring(0, n - b))
        }
        return seen.min()!!
    }
}
