class Solution {
    fun shortestSuperstring(words: Array<String>): String {
        val n = words.size
        val overlap = Array(n) { IntArray(n) }
        
        fun getOverlap(a: String, b: String): Int {
            var maxOlap = 0
            for (k in 1..minOf(a.length, b.length)) {
                if (a.substring(a.length - k) == b.substring(0, k)) {
                    maxOlap = maxOf(maxOlap, k)
                }
            }
            return maxOlap
        }
        
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (i != j) {
                    overlap[i][j] = getOverlap(words[i], words[j])
                }
            }
        }
        
        val dp = Array(1 shl n) { arrayOfNulls<String>(n) }
        for (i in 0 until n) {
            dp[1 shl i][i] = words[i]
        }
        
        for (mask in 0 until (1 shl n)) {
            for (u in 0 until n) {
                if ((mask and (1 shl u)) == 0) continue
                for (v in 0 until n) {
                    if ((mask and (1 shl v)) != 0) continue
                    val newMask = mask or (1 shl v)
                    val candidate = dp[mask][u]!! + words[v].substring(overlap[u][v])
                    if (dp[newMask][v] == null || candidate.length < dp[newMask][v]!!.length) {
                        dp[newMask][v] = candidate
                    }
                }
            }
        }
        
        var shortest = ""
        for (candidate in dp[(1 shl n) - 1]) {
            if (shortest.isEmpty() || candidate!!.length < shortest.length) {
                shortest = candidate!!
            }
        }
        return shortest
    }
}
