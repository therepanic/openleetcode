class Solution {
    fun maxProduct(s: String): Long {
        val n = s.length
        
        // Manacher (odd length only)
        val d = IntArray(n)
        var l = 0
        var r = -1
        
        for (i in 0 until n) {
            var k: Int
            if (i > r) {
                k = 1
            } else {
                k = minOf(d[l + r - i], r - i + 1)
            }
            
            while (i - k >= 0 && i + k < n && s[i - k] == s[i + k]) {
                k++
            }
            
            d[i] = k
            
            if (i + k - 1 > r) {
                l = i - k + 1
                r = i + k - 1
            }
        }
        
        // left[i] = max palindrome ending at i
        val left = IntArray(n)
        
        for (i in 0 until n) {
            val radius = d[i]
            val length = 2 * radius - 1
            val end = i + radius - 1
            left[end] = maxOf(left[end], length)
        }
        
        // propagate backwards (reduce by 2)
        for (i in n - 2 downTo 0) {
            left[i] = maxOf(left[i], left[i + 1] - 2)
        }
        
        // prefix max
        for (i in 1 until n) {
            left[i] = maxOf(left[i], left[i - 1])
        }
        
        
        // right[i] = max palindrome starting at i
        val right = IntArray(n)
        
        for (i in 0 until n) {
            val radius = d[i]
            val length = 2 * radius - 1
            val start = i - radius + 1
            right[start] = maxOf(right[start], length)
        }
        
        // propagate forward (reduce by 2)
        for (i in 1 until n) {
            right[i] = maxOf(right[i], right[i - 1] - 2)
        }
        
        // suffix max
        for (i in n - 2 downTo 0) {
            right[i] = maxOf(right[i], right[i + 1])
        }
        
        
        // try all splits
        var ans = 0L
        for (i in 0 until n - 1) {
            ans = maxOf(ans, left[i].toLong() * right[i + 1].toLong())
        }
        
        return ans
    }
}
