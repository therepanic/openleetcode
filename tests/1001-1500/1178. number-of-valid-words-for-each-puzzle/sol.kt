class Solution {
    fun findNumOfValidWords(words: Array<String>, puzzles: Array<String>): List<Int> {
        fun getMask(s: String): Int {
            var mask = 0
            for (ch in s) {
                mask = mask or (1 shl (ch - 'a'))
            }
            return mask
        }
        
        val wordCount = mutableMapOf<Int, Int>()
        for (w in words) {
            val mask = getMask(w)
            wordCount[mask] = (wordCount[mask] ?: 0) + 1
        }
        
        val result = mutableListOf<Int>()
        for (p in puzzles) {
            val firstMask = 1 shl (p[0] - 'a')
            val puzzleMask = getMask(p)
            var sub = puzzleMask
            var count = 0
            while (true) {
                if ((sub and firstMask) != 0) {
                    count += wordCount[sub] ?: 0
                }
                if (sub == 0) break
                sub = (sub - 1) and puzzleMask
            }
            result.add(count)
        }
        return result
    }
}
