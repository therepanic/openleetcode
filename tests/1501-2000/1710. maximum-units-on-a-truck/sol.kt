class Solution {
    fun maximumUnits(boxTypes: Array<IntArray>, truckSize: Int): Int {
        boxTypes.sortByDescending { it[1] }
        var ans = 0
        var remaining = truckSize
        for (box in boxTypes) {
            val quantitytaken = minOf(remaining, box[0])
            ans += box[1] * quantitytaken
            remaining -= quantitytaken
            if (remaining == 0) break
        }
        return ans
    }
}
