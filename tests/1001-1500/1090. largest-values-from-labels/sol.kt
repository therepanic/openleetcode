class Solution {
    fun largestValsFromLabels(values: IntArray, labels: IntArray, numWanted: Int, useLimit: Int): Int {
        val n = values.size
        val pairs = Array(n) { intArrayOf(values[it], labels[it]) }
        pairs.sortByDescending { it[0] }
        var res = 0
        var wanted = numWanted
        val freq = mutableMapOf<Int, Int>()
        for (pair in pairs) {
            if (wanted == 0) break
            val value = pair[0]
            val label = pair[1]
            if (!freq.containsKey(label) || freq[label]!! < useLimit) {
                res += value
                freq[label] = freq.getOrDefault(label, 0) + 1
                wanted--
            }
        }
        return res
    }
}
