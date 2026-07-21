class Solution {
    fun stringMatching(words: Array<String>): List<String> {
        val n = words.size
        val ans = mutableListOf<String>()
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (i != j && words[j].contains(words[i])) {
                    ans.add(words[i])
                    break
                }
            }
        }
        return ans
    }
}
