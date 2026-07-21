class Solution {
    fun generateTheString(n: Int): String {
        return if (n % 2 == 1) {
            "a".repeat(n)
        } else {
            "a".repeat(n - 1) + "b"
        }
    }
}
