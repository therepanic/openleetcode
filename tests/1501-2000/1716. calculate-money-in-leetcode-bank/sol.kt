class Solution {
    fun totalMoney(n: Int): Int {
        val q = n / 7
        val r = n % 7
        return arithmeticProgression(28, 28+(q-1)*7, q) + arithmeticProgression(q+1, q+r, r)
    }
    private fun arithmeticProgression(leading: Int, last: Int, terms: Int): Int {
        return (leading+last)*terms/2
    }
}
