class Solution {
    fun findAllConcatenatedWordsInADict(words: Array<String>): List<String> {
        val res = mutableListOf<String>()
        val wordSet = words.toMutableSet()
        val incorrect = mutableSetOf<String>()
        
        fun dfs(word: String): Boolean {
            if (word in wordSet) return true
            if (word in incorrect) return false
            
            for (i in 1 until word.length) {
                val prefix = word.substring(0, i)
                if (prefix in wordSet) {
                    val suffix = word.substring(i)
                    if (dfs(suffix)) {
                        return true
                    } else {
                        incorrect.add(suffix)
                    }
                }
            }
            
            incorrect.add(word)
            return false
        }
        
        for (word in words) {
            wordSet.remove(word)
            if (dfs(word)) {
                res.add(word)
            }
            wordSet.add(word)
        }
        
        return res
    }
}
