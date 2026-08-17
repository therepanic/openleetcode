class Solution {
    fun isThree(n: Int): Boolean {
        var count = 0
        for (i in 1..n) {
            if (n % i == 0) {
                count++
            }
        }
        return count == 3
    }
}
