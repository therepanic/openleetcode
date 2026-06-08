class Solution {
    fun merge(intervals: Array<IntArray>): Array<IntArray> {
        intervals.sortBy { it[0] }
        val merged = mutableListOf<IntArray>()

        for (interval in intervals) {
            if (merged.isEmpty() || merged[merged.size - 1][1] < interval[0]) {
                merged.add(interval)
            } else {
                merged[merged.size - 1][1] = maxOf(merged[merged.size - 1][1], interval[1])
            }
        }

        return merged.toTypedArray()
    }
}
