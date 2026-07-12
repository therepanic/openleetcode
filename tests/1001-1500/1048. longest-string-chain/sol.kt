class Solution {
    fun longestStrChain(words: Array<String>): Int {
        val chains = mutableMapOf<String, Int>()
        val sortedWords = words.sortedBy { it.length }
        
        for (word in sortedWords) {
            chains[word] = 1
            for (i in word.indices) {
                val pred = word.substring(0, i) + word.substring(i + 1)
                if (chains.containsKey(pred)) {
                    chains[word] = maxOf(chains[word]!!, chains[pred]!! + 1)
                }
            }
        }
        
        return chains.values.max()
    }
}
