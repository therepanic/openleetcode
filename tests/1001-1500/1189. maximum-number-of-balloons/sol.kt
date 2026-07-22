class Solution {
    fun maxNumberOfBalloons(text: String): Int {
        val f = IntArray(26)
        for (c in text) {
            f[c - 'a']++
        }
        return minOf(f['b' - 'a'], f['a' - 'a'], f['l' - 'a'] / 2, f['o' - 'a'] / 2, f['n' - 'a'])
    }
}
