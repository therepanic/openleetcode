class Solution {
    fun numSmallerByFrequency(queries: Array<String>, words: Array<String>): IntArray {
        fun f(s: String): Int {
            var minChar = 'z'
            var count = 0
            for (c in s) {
                if (c < minChar) {
                    minChar = c
                    count = 1
                } else if (c == minChar) {
                    count++
                }
            }
            return count
        }
        
        val buckets = IntArray(12)
        for (w in words) {
            buckets[f(w)]++
        }
        for (i in 9 downTo 0) {
            buckets[i] += buckets[i + 1]
        }
        return queries.map { buckets[f(it) + 1] }.toIntArray()
    }
}
