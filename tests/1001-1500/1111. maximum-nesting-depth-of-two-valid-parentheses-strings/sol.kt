class Solution {
    fun maxDepthAfterSplit(seq: String): IntArray {
        val res = IntArray(seq.length)
        var depth = 0
        for (i in seq.indices) {
            val ch = seq[i]
            if (ch == '(') {
                depth++
                res[i] = depth % 2
            } else {
                res[i] = depth % 2
                depth--
            }
        }
        return res
    }
}
