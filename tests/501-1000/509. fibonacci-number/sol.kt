class Solution {
    fun fib(n: Int): Int {
        val sqrt5 = Math.sqrt(5.0)
        val fibN = Math.pow((1 + sqrt5) / 2, n.toDouble()) - Math.pow((1 - sqrt5) / 2, n.toDouble())
        return Math.round(fibN / sqrt5).toInt()
    }
}
