class Solution {
    fun maxUniqueSplit(s: String): Int {
        val used = mutableSetOf<String>()
        var ans = 0
        fun backtrack(index: Int) {
            if (index == s.length) {
                ans = maxOf(ans, used.size)
                return
            }
            for (j in index until s.length) {
                val curr = s.substring(index, j + 1)
                if (curr in used) continue
                used.add(curr)
                backtrack(j + 1)
                used.remove(curr)
            }
        }
        backtrack(0)
        return ans
    }
}
