class Solution {
    fun checkRecord(s: String): Boolean {
        var aCount = 0
        var lStreak = 0
        
        for (c in s) {
            if (c == 'A') {
                aCount++
                if (aCount >= 2) {
                    return false
                }
            }
            if (c == 'L') {
                lStreak++
                if (lStreak >= 3) {
                    return false
                }
            } else {
                lStreak = 0
            }
        }
        
        return true
    }
}
