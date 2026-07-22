class Solution {
    fun numSteps(s: String): Int {
        var steps = 0
        var carry = 0
        
        for (i in s.length - 1 downTo 1) {
            val bit = (s[i] - '0') + carry
            
            if (bit == 1) {
                steps += 2
                carry = 1
            } else {
                steps += 1
            }
        }
        
        return steps + carry
    }
}
