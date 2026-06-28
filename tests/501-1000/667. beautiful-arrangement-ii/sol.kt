class Solution {
    fun constructArray(n: Int, k: Int): IntArray {
        val ans = IntArray(n)
        var idx = 0
        for (i in 1..n - k) {
            ans[idx++] = i
        }
        for (i in 0 until k) {
            val diff = i / 2 + 1
            if (i % 2 == 0) {
                ans[idx++] = n - diff + 1
            } else {
                ans[idx++] = n - k + diff
            }
        }
        return ans
    }
}
