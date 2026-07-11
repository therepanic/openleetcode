class Solution {
    fun camelMatch(queries: Array<String>, pattern: String): List<Boolean> {
        val ans = mutableListOf<Boolean>()
        for (query in queries) {
            var j = 0
            var i = 0
            while (i < query.length) {
                if (query[i].isUpperCase() && ((j < pattern.length && query[i] != pattern[j]) || j > pattern.length - 1)) {
                    break
                }
                if (j < pattern.length && query[i] == pattern[j]) {
                    j++
                }
                i++
            }
            if (i == query.length && j == pattern.length) {
                ans.add(true)
            } else {
                ans.add(false)
            }
        }
        return ans
    }
}
