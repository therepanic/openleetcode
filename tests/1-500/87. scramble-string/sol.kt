class Solution {
    private val memo = HashMap<String, Boolean>()

    fun isScramble(s1: String, s2: String): Boolean {
        if (s1.length != s2.length) return false
        memo.clear()
        return dfs(s1, s2)
    }

    private fun dfs(a: String, b: String): Boolean {
        if (a == b) return true

        val key = "$a#$b"
        memo[key]?.let { return it }

        val counts = IntArray(26)
        for (i in a.indices) {
            counts[a[i] - 'a']++
            counts[b[i] - 'a']--
        }
        for (count in counts) {
            if (count != 0) {
                memo[key] = false
                return false
            }
        }

        val n = a.length
        for (i in 1 until n) {
            if (dfs(a.substring(0, i), b.substring(0, i)) && dfs(a.substring(i), b.substring(i))) {
                memo[key] = true
                return true
            }
            if (dfs(a.substring(0, i), b.substring(n - i)) && dfs(a.substring(i), b.substring(0, n - i))) {
                memo[key] = true
                return true
            }
        }

        memo[key] = false
        return false
    }
}
