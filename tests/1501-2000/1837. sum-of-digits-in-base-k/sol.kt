class Solution {
    fun sumBase(n: Int, k: Int): Int {
        var total = 0
        var num = n
        while (num > 0) {
            total += num % k
            num /= k
        }
        return total
    }
}
