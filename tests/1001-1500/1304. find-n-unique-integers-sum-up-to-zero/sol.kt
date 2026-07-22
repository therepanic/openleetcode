class Solution {
    fun sumZero(n: Int): IntArray {
        return IntArray(n) { i -> i * 2 - n + 1 }
    }
}
