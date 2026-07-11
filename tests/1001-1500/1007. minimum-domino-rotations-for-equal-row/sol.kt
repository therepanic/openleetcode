class Solution {
    fun minDominoRotations(tops: IntArray, bottoms: IntArray): Int {
        val n = tops.size
        var res = Int.MAX_VALUE
        val face = IntArray(7)
        for (i in 0 until n) {
            face[tops[i]]++
            if (bottoms[i] != tops[i]) {
                face[bottoms[i]]++
            }
        }
        for (x in 1..6) {
            if (face[x] < n) {
                continue
            }
            var maintainTop = 0
            var maintainBottom = 0
            var possible = true
            for (i in 0 until n) {
                if (tops[i] != x) {
                    maintainTop++
                }
                if (bottoms[i] != x) {
                    maintainBottom++
                }
            }
            if (possible) {
                res = minOf(res, minOf(maintainTop, maintainBottom))
            }
        }
        return if (res == Int.MAX_VALUE) -1 else res
    }
}
