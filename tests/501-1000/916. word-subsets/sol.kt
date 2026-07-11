class Solution {
    fun wordSubsets(words1: Array<String>, words2: Array<String>): List<String> {
        val maxCharFreq = IntArray(26)
        val tempCharFreq = IntArray(26)

        for (word in words2) {
            for (ch in word) {
                tempCharFreq[ch - 'a']++
            }
            for (i in 0..25) {
                maxCharFreq[i] = maxOf(maxCharFreq[i], tempCharFreq[i])
            }
            tempCharFreq.fill(0)
        }

        val universalWords = mutableListOf<String>()

        for (word in words1) {
            for (ch in word) {
                tempCharFreq[ch - 'a']++
            }
            var isUniversal = true
            for (i in 0..25) {
                if (maxCharFreq[i] > tempCharFreq[i]) {
                    isUniversal = false
                    break
                }
            }
            if (isUniversal) {
                universalWords.add(word)
            }
            tempCharFreq.fill(0)
        }

        return universalWords
    }
}
