class Solution {
    fun queryString(s: String, n: Int): Boolean {
        for (num in n downTo 1) {
            val target = Integer.toBinaryString(num)
            val length = target.length
            var left = 0
            var valid = false
            for (right in s.indices) {
                while (right - left + 1 > length) {
                    left++
                }
                if (s.substring(left, right + 1) == target) {
                    valid = true
                    break
                }
            }
            if (!valid) {
                return false
            }
        }
        return true
    }
}
