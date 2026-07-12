class Solution {
    fun findReplaceString(s: String, indices: IntArray, sources: Array<String>, targets: Array<String>): String {
        val patch = mutableMapOf<Int, Pair<String, String>>()
        for (k in indices.indices) {
            val i = indices[k]
            val src = sources[k]
            val tgt = targets[k]
            if (i + src.length <= s.length && s.substring(i, i + src.length) == src) {
                patch[i] = Pair(src, tgt)
            }
        }
        val res = StringBuilder()
        var i = 0
        val n = s.length
        while (i < n) {
            if (patch.containsKey(i)) {
                val (src, tgt) = patch[i]!!
                res.append(tgt)
                i += src.length
            } else {
                res.append(s[i])
                i++
            }
        }
        return res.toString()
    }
}
