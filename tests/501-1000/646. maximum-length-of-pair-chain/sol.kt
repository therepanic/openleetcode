class Solution {
    fun findLongestChain(pairs: Array<IntArray>): Int {
        pairs.sortBy { it[1] }
        var prev = pairs[0]
        var res = 1
        for (i in 1 until pairs.size) {
            val cur = pairs[i]
            if (cur[0] > prev[1]) {
                res++
                prev = cur
            }
        }
        return res
    }
}
