class Solution {
    fun countConsistentStrings(allowed: String, words: Array<String>): Int {
        var result = 0
        val allowedSet = allowed.toSet()
        for (word in words) {
            var allIn = true
            for (c in word) {
                if (c !in allowedSet) {
                    allIn = false
                    break
                }
            }
            if (allIn) result++
        }
        return result
    }
}
