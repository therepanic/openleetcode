class Solution {
    fun minCut(s: String): Int {
        val n = s.length
        val cuts = IntArray(n) { it }
        var center = 0
        while (center < n) {
            var left = center
            var right = center
            while (left >= 0 && right < n && s[left] == s[right]) {
                val newCut = if (left == 0) 0 else cuts[left - 1] + 1
                if (newCut < cuts[right]) {
                    cuts[right] = newCut
                }
                left--
                right++
            }

            left = center
            right = center + 1
            while (left >= 0 && right < n && s[left] == s[right]) {
                val newCut = if (left == 0) 0 else cuts[left - 1] + 1
                if (newCut < cuts[right]) {
                    cuts[right] = newCut
                }
                left--
                right++
            }
            center++
        }
        return cuts[n - 1]
    }
}
