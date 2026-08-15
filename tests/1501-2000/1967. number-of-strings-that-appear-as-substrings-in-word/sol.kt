class Solution {
    fun numOfStrings(patterns: Array<String>, word: String): Int {
        var count = 0
        for (s in patterns) {
            if (word.contains(s)) {
                count++
            }
        }
        return count
    }
}
