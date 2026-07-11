class Solution {
    fun buddyStrings(s: String, goal: String): Boolean {
        if (s.length != goal.length) return false
        if (s == goal) {
            return s.toCharArray().distinct().size < s.length
        }
        val diffs = mutableListOf<Int>()
        for (i in s.indices) {
            if (s[i] != goal[i]) {
                diffs.add(i)
            }
        }
        return diffs.size == 2 && s[diffs[0]] == goal[diffs[1]] && s[diffs[1]] == goal[diffs[0]]
    }
}
