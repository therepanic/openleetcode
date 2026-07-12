class Solution {
    fun numSpecialEquivGroups(words: Array<String>): Int {
        val seen = mutableSetOf<String>()
        for (w in words) {
            val even = StringBuilder()
            val odd = StringBuilder()
            for (i in w.indices) {
                if (i % 2 == 0) even.append(w[i])
                else odd.append(w[i])
            }
            val evenSorted = even.toString().toCharArray().sorted().joinToString("")
            val oddSorted = odd.toString().toCharArray().sorted().joinToString("")
            seen.add("$evenSorted,$oddSorted")
        }
        return seen.size
    }
}
