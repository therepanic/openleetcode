class Solution {
    fun shortestCommonSupersequence(str1: String, str2: String): String {
        val m = str1.length
        val n = str2.length
        val dp = Array(m + 1) { IntArray(n + 1) }
        
        for (i in 1..m) {
            for (j in 1..n) {
                if (str1[i-1] == str2[j-1]) {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = maxOf(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        var i = m
        var j = n
        val result = StringBuilder()
        
        while (i > 0 && j > 0) {
            if (str1[i-1] == str2[j-1]) {
                result.append(str1[i-1])
                i--
                j--
            } else if (dp[i-1][j] > dp[i][j-1]) {
                result.append(str1[i-1])
                i--
            } else {
                result.append(str2[j-1])
                j--
            }
        }
        
        while (i > 0) {
            result.append(str1[i-1])
            i--
        }
        
        while (j > 0) {
            result.append(str2[j-1])
            j--
        }
        
        return result.reverse().toString()
    }
}
