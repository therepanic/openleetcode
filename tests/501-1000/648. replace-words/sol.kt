class Solution {
    private fun addInTrie(trie: MutableMap<String, Any>, word: String) {
        var n = trie
        for (letter in word) {
            val key = letter.toString()
            if (!n.containsKey(key)) {
                n[key] = mutableMapOf<String, Any>("*" to false)
            }
            n = n[key] as MutableMap<String, Any>
        }
        n["*"] = true
    }
    
    private fun getReplacement(trie: MutableMap<String, Any>, word: String): String {
        var n = trie
        for (i in word.indices) {
            if (n["*"] as Boolean) {
                return word.substring(0, i)
            }
            val key = word[i].toString()
            if (!n.containsKey(key)) {
                break
            }
            n = n[key] as MutableMap<String, Any>
        }
        return word
    }
    
    fun replaceWords(dictionary: Array<String>, sentence: String): String {
        val trie = mutableMapOf<String, Any>("*" to false)
        val arr = sentence.split(" ").toMutableList()
        
        for (word in dictionary) {
            addInTrie(trie, word)
        }
        
        for (i in arr.indices) {
            arr[i] = getReplacement(trie, arr[i])
        }
        
        return arr.joinToString(" ")
    }
}
