class Solution {
    fun isTransformable(s: String, t: String): Boolean {
        if (s.toCharArray().sorted() != t.toCharArray().sorted()) return false
        
        val pos = Array(10) { ArrayDeque<Int>() }
        s.forEachIndexed { i, ss -> pos[ss-'0'].addLast(i) }
            
        for (tt in t) {
            val i = pos[tt-'0'].removeFirst()
            for (ii in 0 until tt-'0') {
                if (pos[ii].isNotEmpty() && pos[ii].first() < i) return false
            }
        }
        return true
    }
}
