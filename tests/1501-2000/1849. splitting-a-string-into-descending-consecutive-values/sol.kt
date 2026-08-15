class Solution {
    fun splitString(s: String): Boolean {
        fun dfs(index: Int, prev: Long, count: Int): Boolean {
            if (index == s.length) return count >= 2
            
            var curr = 0L
            for (i in index until s.length) {
                curr = curr * 10 + (s[i] - '0')
                if (prev == -1L || prev - curr == 1L) {
                    if (dfs(i + 1, curr, count + 1)) return true
                } else if (curr >= prev && prev != -1L) {
                    break
                }
            }
            return false
        }
        
        return dfs(0, -1, 0)
    }
}
