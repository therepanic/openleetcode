class Solution {
    fun findLeastNumOfUniqueInts(arr: IntArray, k: Int): Int {
        val counts = arr.toList().groupingBy { it }.eachCount()
        var remaining = counts.size
        var tempK = k
        val sortedFreqs = counts.values.sorted()
        for (count in sortedFreqs) {
            if (tempK < count) break
            tempK -= count
            remaining--
        }
        return remaining
    }
}
