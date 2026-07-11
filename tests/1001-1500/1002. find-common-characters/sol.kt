class Solution {
    fun commonChars(words: Array<String>): List<String> {
        val freq = mutableMapOf<Char, Int>()
        for (c in words[0]) {
            freq[c] = freq.getOrDefault(c, 0) + 1
        }
        for (i in 1 until words.size) {
            val f = mutableMapOf<Char, Int>()
            for (c in words[i]) {
                f[c] = f.getOrDefault(c, 0) + 1
            }
            for (c in freq.keys.toList()) {
                if (f.containsKey(c)) {
                    freq[c] = minOf(f[c]!!, freq[c]!!)
                } else {
                    freq[c] = 0
                }
            }
        }
        val res = mutableListOf<String>()
        for ((c, count) in freq) {
            repeat(count) { res.add(c.toString()) }
        }
        return res
    }
}
