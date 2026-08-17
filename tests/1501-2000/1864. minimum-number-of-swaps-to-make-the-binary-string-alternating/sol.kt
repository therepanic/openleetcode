class Solution {
    fun minSwaps(s: String): Int {
        val count0 = s.count { it == '0' }
        val count1 = s.count { it == '1' }
        
        if (Math.abs(count0 - count1) > 1) return -1
        
        val mismatch0 = s.indices.count { i -> s[i] != (if (i % 2 == 0) '0' else '1') }
        val mismatch1 = s.indices.count { i -> s[i] != (if (i % 2 == 0) '1' else '0') }
        
        return when {
            count0 == count1 -> Math.min(mismatch0 / 2, mismatch1 / 2)
            count0 > count1 -> mismatch0 / 2
            else -> mismatch1 / 2
        }
    }
}
