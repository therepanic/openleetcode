class Solution {
    fun numEquivDominoPairs(dominoes: Array<IntArray>): Int {
        val mpp = IntArray(100)
        var count = 0
        for (d in dominoes) {
            val a = d[0]
            val b = d[1]
            val key = if (a <= b) a * 10 + b else b * 10 + a
            count += mpp[key]
            mpp[key]++
        }
        return count
    }
}
