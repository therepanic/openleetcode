class Solution {
    fun findRepeatedDnaSequences(s: String): List<String> {
        val seen = HashMap<String, Int>()
        val ans = ArrayList<String>()
        val n = s.length
        var i = 0
        while (i + 10 <= n) {
            val sub = s.substring(i, i + 10)
            val prev = seen[sub]
            if (prev == null) {
                seen[sub] = 1
            } else {
                if (prev == 1) ans.add(sub)
                seen[sub] = prev + 1
            }
            i++
        }
        return ans
    }
}
