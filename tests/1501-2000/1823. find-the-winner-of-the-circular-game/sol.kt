class Solution {
    fun findTheWinner(n: Int, k: Int): Int {
        var res = 0
        for (i in 2..n) {
            res = (res + k) % i
        }
        return res + 1
    }
}
