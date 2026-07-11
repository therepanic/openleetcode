class Solution {
    fun smallestRepunitDivByK(k: Int): Int {
        if (k == 1) {
            return 1
        }
        
        if (k % 2 == 0 || k % 5 == 0) {
            return -1
        }
        
        var rem = 0
        for (i in 1..k) {
            rem = (rem * 10 + 1) % k
            if (rem == 0) {
                return i
            }
        }
        
        return -1
    }
}
