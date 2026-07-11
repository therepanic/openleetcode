class Solution {
    fun minFlipsMonoIncr(s: String): Int {
        var zeroes = 0
        var ones = 0
        
        for (ch in s) {
            if (ch == '0') {
                zeroes++
            }
        }
        
        var output = zeroes
        
        for (ch in s) {
            if (ch == '0') {
                zeroes--
            } else if (ch == '1') {
                ones++
            }
            output = minOf(output, zeroes + ones)
        }
        
        return output
    }
}
