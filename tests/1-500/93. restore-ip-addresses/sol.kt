class Solution {
    fun restoreIpAddresses(s: String): List<String> {
        val result = mutableListOf<String>()
        backtrack(s, 0, mutableListOf(), result)
        return result
    }

    private fun backtrack(s: String, index: Int, parts: MutableList<String>, result: MutableList<String>) {
        if (parts.size == 4) {
            if (index == s.length) {
                result.add(parts.joinToString("."))
            }
            return
        }

        for (length in 1..3) {
            if (index + length > s.length) break
            val segment = s.substring(index, index + length)
            if (isValid(segment)) {
                parts.add(segment)
                backtrack(s, index + length, parts, result)
                parts.removeAt(parts.lastIndex)
            }
        }
    }

    private fun isValid(segment: String): Boolean {
        if (segment.length > 1 && segment[0] == '0') return false
        return segment.toInt() <= 255
    }
}
