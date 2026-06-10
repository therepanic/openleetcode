class Solution {
    fun partition(s: String): List<List<String>> {
        val n = s.length
        val isPalindrome = Array(n) { BooleanArray(n) }
        var end = 0
        while (end < n) {
            var start = end
            while (start >= 0) {
                if (s[start] == s[end] && (end - start < 2 || isPalindrome[start + 1][end - 1])) {
                    isPalindrome[start][end] = true
                }
                start--
            }
            end++
        }

        val result = mutableListOf<List<String>>()
        val path = mutableListOf<String>()
        fun backtrack(index: Int) {
            if (index == n) {
                result.add(path.toList())
                return
            }
            var nextEnd = index
            while (nextEnd < n) {
                if (isPalindrome[index][nextEnd]) {
                    path.add(s.substring(index, nextEnd + 1))
                    backtrack(nextEnd + 1)
                    path.removeAt(path.lastIndex)
                }
                nextEnd++
            }
        }
        backtrack(0)
        return result
    }
}
