class Solution {
    fun canReorderDoubled(arr: IntArray): Boolean {
        val freq = mutableMapOf<Int, Int>()
        for (i in arr) {
            freq[i] = freq.getOrDefault(i, 0) + 1
        }

        val sorted = arr.toMutableList()
        sorted.sortBy { kotlin.math.abs(it) }
        for (value in sorted) {
            if (freq[value] == 0) continue
            val target = value * 2
            if (freq.containsKey(target) && freq[target]!! > 0) {
                freq[value] = freq[value]!! - 1
                freq[target] = freq[target]!! - 1
            } else {
                return false
            }
        }
        return true
    }
}
