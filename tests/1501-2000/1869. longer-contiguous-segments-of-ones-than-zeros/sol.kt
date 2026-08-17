class Solution {
    fun checkZeroOnes(s: String): Boolean {
        var max1 = 0
        var max0 = 0
        var one = 0
        var zero = 0
        
        for (ch in s) {
            if (ch == '1') {
                one++
                zero = 0
                max1 = maxOf(max1, one)
            } else {
                zero++
                one = 0
                max0 = maxOf(max0, zero)
            }
        }
        
        return max1 > max0
    }
}
