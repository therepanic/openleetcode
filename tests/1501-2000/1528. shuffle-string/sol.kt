class Solution {
    fun restoreString(s: String, indices: IntArray): String {
        val res = CharArray(indices.size)
        for (i in indices.indices) {
            res[indices[i]] = s[i]
        }
        return String(res)
    }
}
