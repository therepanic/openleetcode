class Solution {
    fun nearestPalindromic(n: String): String {
        val num = n.toLong()
        val v1 = prevPal(num)
        val v2 = nextPal(num)
        return if (Math.abs(v1 - num) > Math.abs(v2 - num)) v2.toString() else v1.toString()
    }
    
    private fun convert(num: Long): Long {
        val s = num.toString().toCharArray()
        var l = 0
        var r = s.size - 1
        while (l <= r) {
            s[r] = s[l]
            r--
            l++
        }
        return String(s).toLong()
    }
    
    private fun prevPal(num: Long): Long {
        var low = 0L
        var high = 1e19.toLong()
        var ans = -1L
        while (low <= high) {
            val mid = (low + high) shr 1
            val v = convert(mid)
            if (v >= num) {
                high = mid - 1
            } else {
                low = mid + 1
                ans = v
            }
        }
        return ans
    }
    
    private fun nextPal(num: Long): Long {
        var low = 0L
        var high = 1e19.toLong()
        var ans = -1L
        while (low <= high) {
            val mid = (low + high) shr 1
            val v = convert(mid)
            if (v <= num) {
                low = mid + 1
            } else {
                ans = v
                high = mid - 1
            }
        }
        return ans
    }
}
