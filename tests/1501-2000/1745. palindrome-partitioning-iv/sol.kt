class Solution {
    fun checkPartitioning(s: String): Boolean {
        val n = s.length
        val pal = Array(n) { BooleanArray(n) }
        for (i in 0 until n) pal[i][i] = true
        for (length in 2..n) {
            for (i in 0..n-length) {
                val j = i+length-1
                if (s[i]==s[j] && (length==2 || pal[i+1][j-1])) {
                    pal[i][j] = true
                }
            }
        }
        for (i in 0 until n-2) {
            if (pal[0][i]) {
                for (j in i+1 until n-1) {
                    if (pal[i+1][j] && pal[j+1][n-1]) return true
                }
            }
        }
        return false
    }
}
