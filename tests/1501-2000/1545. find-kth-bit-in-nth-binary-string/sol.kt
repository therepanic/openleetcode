class Solution {
    fun findKthBit(n: Int, k: Int): Char {
        if (n == 1) {
            return '0'
        }
        
        val length = (1 shl n) - 1
        val mid = (length + 1) / 2
        
        if (k == mid) {
            return '1'
        }
        if (k < mid) {
            return findKthBit(n - 1, k)
        }
        
        val c = findKthBit(n - 1, length - k + 1)
        return if (c == '0') '1' else '0'
    }
}
