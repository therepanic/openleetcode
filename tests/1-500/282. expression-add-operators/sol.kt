class Solution {
    fun addOperators(num: String, target: Int): List<String> {
        val res = mutableListOf<String>()
        val n = num.length
        
        fun backtrack(idx: Int, path: String, curr: Long, prev: Long) {
            if (idx == n) {
                if (curr == target.toLong()) {
                    res.add(path)
                }
                return
            }
            for (i in idx until n) {
                if (i > idx && num[idx] == '0') break
                val s = num.substring(idx, i+1)
                val value = s.toLong()
                if (idx == 0) {
                    backtrack(i+1, s, value, value)
                } else {
                    backtrack(i+1, "$path+$s", curr+value, value)
                    backtrack(i+1, "$path-$s", curr-value, -value)
                    backtrack(i+1, "$path*$s", (curr-prev)+(prev*value), prev*value)
                }
            }
        }
        
        if (num.isNotEmpty()) {
            backtrack(0, "", 0, 0)
        }
        return res
    }
}
