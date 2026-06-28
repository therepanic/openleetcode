class Solution {
    fun kthGrammar(n: Int, k: Int): Int {
        if (n == 1) {
            return 0
        }
        val parent = kthGrammar(n - 1, (k + 1) / 2)
        return if (k % 2 == 1) parent else 1 - parent
    }
}
