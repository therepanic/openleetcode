class Solution {
    fun numberOfWeeks(milestones: IntArray): Long {
        var total = 0L
        var maxVal = 0L
        for (m in milestones) {
            total += m
            if (m > maxVal) maxVal = m.toLong()
        }
        return if (maxVal <= total - maxVal) total else 2 * (total - maxVal) + 1
    }
}
