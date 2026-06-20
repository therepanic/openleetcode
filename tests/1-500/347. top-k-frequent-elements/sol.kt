class Solution {
    fun topKFrequent(nums: IntArray, k: Int): IntArray {
        val freq = mutableMapOf<Int, Int>()
        for (i in nums) {
            freq[i] = freq.getOrDefault(i, 0) + 1
        }
        return freq.entries
            .sortedByDescending { it.value }
            .map { it.key }
            .take(k)
            .toIntArray()
    }
}
