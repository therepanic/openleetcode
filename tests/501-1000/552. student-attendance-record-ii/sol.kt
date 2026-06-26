class Solution {
    fun checkRecord(n: Int): Int {
        val mod = 1000000007
        var dp = arrayOf(intArrayOf(1, 0, 0), intArrayOf(0, 0, 0))
        
        for (i in 0 until n) {
            val ndp = arrayOf(intArrayOf(0, 0, 0), intArrayOf(0, 0, 0))
            for (absences in 0 until 2) {
                for (lates in 0 until 3) {
                    val cur = dp[absences][lates]
                    if (cur == 0) continue
                    ndp[absences][0] = (ndp[absences][0] + cur) % mod
                    if (absences == 0) {
                        ndp[1][0] = (ndp[1][0] + cur) % mod
                    }
                    if (lates < 2) {
                        ndp[absences][lates + 1] = (ndp[absences][lates + 1] + cur) % mod
                    }
                }
            }
            dp = ndp
        }
        
        var total = 0
        for (row in dp) {
            for (value in row) {
                total = (total + value) % mod
            }
        }
        return total
    }
}
