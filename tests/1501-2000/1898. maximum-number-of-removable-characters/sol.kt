class Solution {
    fun maximumRemovals(s: String, p: String, removable: IntArray): Int {
        var left = 0
        var right = removable.size
        var maxK = 0
        while (left <= right) {
            val mid = (left + right) / 2
            val removed = BooleanArray(s.length)
            for (i in 0 until mid) {
                removed[removable[i]] = true
            }
            var j = 0
            for (i in s.indices) {
                if (j >= p.length) break
                if (!removed[i] && s[i] == p[j]) {
                    j++
                }
            }
            if (j == p.length) {
                maxK = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return maxK
    }
}
