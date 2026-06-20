class Solution {
    fun isPowerOfFour(n: Int): Boolean {
        return n > 0 && Integer.bitCount(n) == 1 && (n - 1) % 3 == 0
    }
}
