class Solution {
    fun maxEqualFreq(nums: IntArray): Int {
        val counts = mutableMapOf<Int, Int>()
        val frequencyCounts = mutableMapOf<Int, Int>()
        var best = 0

        for ((i, value) in nums.withIndex()) {
            val index = i + 1
            val previous = counts.getOrDefault(value, 0)
            if (previous > 0) {
                frequencyCounts[previous] = frequencyCounts[previous]!! - 1
                if (frequencyCounts[previous] == 0) {
                    frequencyCounts.remove(previous)
                }
            }
            counts[value] = previous + 1
            val frequency = previous + 1
            frequencyCounts[frequency] = frequencyCounts.getOrDefault(frequency, 0) + 1

            when {
                frequencyCounts.size == 1 -> {
                    val (onlyFrequency, valueCount) = frequencyCounts.entries.first()
                    if (onlyFrequency == 1 || valueCount == 1) {
                        best = index
                    }
                }
                frequencyCounts.size == 2 -> {
                    val sorted = frequencyCounts.keys.sorted()
                    val low = sorted[0]
                    val high = sorted[1]
                    if ((low == 1 && frequencyCounts[low] == 1) || (high == low + 1 && frequencyCounts[high] == 1)) {
                        best = index
                    }
                }
            }
        }

        return best
    }
}
