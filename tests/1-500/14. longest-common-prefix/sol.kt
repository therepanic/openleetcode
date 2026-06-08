class Solution {
    fun longestCommonPrefix(strs: Array<String>): String {
        if (strs.isEmpty()) {
            return ""
        }

        strs.sort()
        val first = strs.first()
        val last = strs.last()
        var i = 0
        while (i < first.length && i < last.length && first[i] == last[i]) {
            i++
        }
        return first.substring(0, i)
    }
}
