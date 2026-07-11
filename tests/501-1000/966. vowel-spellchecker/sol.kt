class Solution {
    fun spellchecker(wordlist: Array<String>, queries: Array<String>): Array<String> {
        val exact = wordlist.toSet()
        val caseMap = mutableMapOf<String, String>()
        val vowelMap = mutableMapOf<String, String>()
        
        for (w in wordlist) {
            val lower = w.lowercase()
            val devowel = deVowel(lower)
            if (lower !in caseMap) {
                caseMap[lower] = w
            }
            if (devowel !in vowelMap) {
                vowelMap[devowel] = w
            }
        }
        
        return queries.map { q ->
            when {
                q in exact -> q
                else -> {
                    val lower = q.lowercase()
                    val devowel = deVowel(lower)
                    when {
                        lower in caseMap -> caseMap[lower]!!
                        devowel in vowelMap -> vowelMap[devowel]!!
                        else -> ""
                    }
                }
            }
        }.toTypedArray()
    }
    
    private fun deVowel(s: String): String {
        return s.map { if (it in "aeiou") '*' else it }.joinToString("")
    }
}
