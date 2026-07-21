class Solution {
    fun equalSubstring(s: String, t: String, maxCost: Int): Int {
        var ans = 0
        var cost = 0
        var left = 0
        for (right in s.indices) {
            cost += Math.abs(s[right] - t[right])
            while (cost > maxCost) {
                cost -= Math.abs(s[left] - t[left])
                left++
            }
            val size = right - left + 1
            if (size > ans) {
                ans = size
            }
        }
        return ans
    }
}
