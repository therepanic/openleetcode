class Solution {
    fun longestSubsequenceRepeatedK(s: String, k: Int): String {
        fun isK(sub: String, t: String, k: Int): Boolean {
            var count = 0
            var i = 0
            for (ch in t) {
                if (i < sub.length && ch == sub[i]) {
                    i++
                    if (i == sub.length) {
                        i = 0
                        count++
                        if (count == k) return true
                    }
                }
            }
            return false
        }

        var res = ""
        val q = ArrayDeque<String>()
        q.add("")
        while (q.isNotEmpty()) {
            val curr = q.removeFirst()
            for (ch in 'a'..'z') {
                val nxt = curr + ch
                if (isK(nxt, s, k)) {
                    res = nxt
                    q.add(nxt)
                }
            }
        }
        return res
    }
}
