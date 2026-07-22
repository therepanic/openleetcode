class Solution {
    fun uniqueOccurrences(arr: IntArray): Boolean {
        val d = mutableMapOf<Int, Int>()
        for (i in arr) {
            if (d.containsKey(i)) {
                d[i] = d[i]!! + 1
            } else {
                d[i] = 1
            }
        }
        val s = mutableSetOf<Int>()
        for (value in d.values) {
            if (s.contains(value)) {
                return false
            }
            s.add(value)
        }
        return true
    }
}
