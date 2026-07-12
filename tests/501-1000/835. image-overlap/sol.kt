class Solution {
    fun largestOverlap(img1: Array<IntArray>, img2: Array<IntArray>): Int {
        val n = img1.size
        val a = mutableListOf<Pair<Int, Int>>()
        val b = mutableListOf<Pair<Int, Int>>()
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (img1[i][j] == 1) a.add(Pair(i, j))
                if (img2[i][j] == 1) b.add(Pair(i, j))
            }
        }
        val cnt = mutableMapOf<Pair<Int, Int>, Int>()
        for ((x1, y1) in a) {
            for ((x2, y2) in b) {
                val key = Pair(x1 - x2, y1 - y2)
                cnt[key] = cnt.getOrDefault(key, 0) + 1
            }
        }
        return cnt.values.maxOrNull() ?: 0
    }
}
