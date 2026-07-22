class Solution {
    fun kthFactor(n: Int, k: Int): Int {
        val ab = mutableListOf<Int>()
        for (i in 1..n) {
            if (n % i == 0) {
                ab.add(i)
            }
        }
        return if (ab.size < k) -1 else ab[k - 1]
    }
}
